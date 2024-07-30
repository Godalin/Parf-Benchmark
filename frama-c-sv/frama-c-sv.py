#!/usr/bin/env python3
# This file is part of frama-c-svcomp,
# a wrapper around Frama-C that makes it possible
# to execute Frama-C as part of the Competition on Software Verification:
# https://gitlab.com/sosy-lab/software/frama-c-svcomp
#
# SPDX-FileCopyrightText: 2020 Dirk Beyer <https://www.sosy-lab.org>
#
# SPDX-License-Identifier: Apache-2.0

import hashlib
import pathlib
import subprocess  # noqa: S404 our intention IS to run frama-c via subprocess
import sys
import re
import argparse
import logging
import pandas as pd
import pycparser
import os

from datetime import datetime
from enum import Enum
from pycparser.plyparser import ParseError

RESULT_TRUE_PROP = "true"
RESULT_FALSE_PROP = "false"
RESULT_UNKNOWN = "unknown"
RESULT_ERROR = "error"
RESULT_FALSE_OVERFLOW = RESULT_FALSE_PROP + "(no-overflow)"
RESULT_FALSE_DEREF = RESULT_FALSE_PROP + "(valid-deref)"

OUT_DIR = "output"

VERSIONSTRING = "frama-c-sv version 0.2.8"


def parse_args():
    parser = argparse.ArgumentParser(
        description="Wrapper around Frama-C for use in SV-COMP."
    )

    parser.add_argument("--property", type=str)
    parser.add_argument("--program", type=str)
    parser.add_argument("--config", type=str, default="")
    parser.add_argument("--datamodel", type=str, default="ILP32")
    parser.add_argument("--version", action="store_true")
    parser.add_argument(
        "--reach-as-overflow", dest="reach_as_overflow", action="store_true"
    )
    parser.add_argument(
        "additional",
        nargs="*",
        metavar="ARG",
        help='command line to run (prefix with "--" '
        + "to ensure all arguments are treated correctly)",
    )

    return parser.parse_args()


class FuncDefVisitor(pycparser.c_ast.NodeVisitor):
    def __init__(self):
        self.func_defs = {}

    def visit_FuncDef(  # noqa N802 function must have this name to be called
        self, node
    ):
        call_visitor = FuncCallVisitor()
        call_visitor.visit(node)
        self.func_defs[node.decl.name] = call_visitor.called


class FuncCallVisitor(pycparser.c_ast.NodeVisitor):
    def __init__(self):
        self.called = set()

    def visit_FuncCall(  # noqa N802 function must have this name to be called
        self, node
    ):
        self.called.add(node.name.name)
        # Visit args in case they contain more function calls
        if node.args:
            self.visit(node.args)


def find_recursive(funcs):
    changed = funcs.keys()
    while changed:
        updated = changed
        changed = set()
        for func in updated:
            for caller in [f for f in funcs if func in funcs[f]]:
                called = funcs[caller].union(funcs[func])
                if len(called) > len(funcs[caller]):
                    funcs[caller] = called
                    changed.add(caller)
    return {func for func in funcs if func in funcs[func]}


def resource(*path_segments):
    return pathlib.Path(__file__).parent.joinpath(*path_segments)


def get_sha256(filename):
    with open(filename, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


def create_witness(result):
    with open(resource("template.graphml"), "r") as f:
        template = f.read()
    if result == RESULT_TRUE_PROP:
        template = re.sub(r"\$WITNESSTYPE", "correctness_witness", template)
        template = re.sub(r"\$VIOLATIONNODE", "", template)
    else:
        template = re.sub(r"\$WITNESSTYPE", "violation_witness", template)
        template = re.sub(
            r"\$VIOLATIONNODE", '\n<data key="violation">true</data>', template
        )
    template = re.sub(r"\$PRODUCER", VERSIONSTRING, template)
    template = re.sub(
        r"\$ARCHITECTURE", "32bit" if args.datamodel == "ILP32" else "64bit", template
    )
    template = re.sub(r"\$PROGRAMFILE", args.program, template)
    template = re.sub(r"\$PROGRAMHASH", get_sha256(args.program), template)
    template = re.sub(r"\$SPECIFICATION", property_text, template)
    timestamp = datetime.utcnow().replace(microsecond=0).isoformat() + "Z"
    template = re.sub(r"\$TIMESTAMP", timestamp, template)
    with open(resource(OUT_DIR, "witness.graphml"), "w") as witness_file:
        witness_file.write(template)


def determine_frama_c_version():
    process = subprocess.Popen(  # noqa S603: we control cmd completely
        ["frama-c", "--version"], stdin=subprocess.PIPE, stdout=subprocess.PIPE
    )
    return (
        "".join([bline.decode("utf-8") for bline in process.stdout.readlines()])
        if process.stdout
        else "unknown(no output on version call)"
    )


class Property(Enum):
    UNREACH_CALL = 1
    NO_OVERFLOW = 2
    MEMORY_SAFETY = 3
    TERMINATION = 4

    @staticmethod
    def from_text(property_text):
        if "overflow" in property_text:
            return Property.NO_OVERFLOW
        elif "reach_error" in property_text:
            return Property.UNREACH_CALL
        elif "valid-free" in property_text:
            return Property.MEMORY_SAFETY
        elif "termination" in property_text:
            return Property.TERMINATION
        else:
            raise ValueError("unknown property %s" % property_text)


class OutputInterpreter:
    def __init__(self, property_):
        self.property = property_

    def interpret(self, lines):
        if self.property == Property.UNREACH_CALL:
            return self._interpret_unreach_call(lines)
        elif self.property == Property.NO_OVERFLOW:
            return self._interpret_no_overflow(lines)
        elif self.property == Property.MEMORY_SAFETY:
            return self._interpret_memory_safety(lines)
        elif self.property == Property.TERMINATION:
            return self._interpret_termination(lines)
        else:
            return f"{RESULT_UNKNOWN}(property)"

    def _interpret_unreach_call(self, lines):
        return RESULT_UNKNOWN

    def _interpret_no_overflow(self, lines):
        return RESULT_UNKNOWN

    def _interpret_memory_safety(self, lines):
        return RESULT_UNKNOWN

    def _interpret_termination(self, lines):
        return RESULT_UNKNOWN


# deprecated, use ReportInterpreter instead!
class ScandiumInterpreter(OutputInterpreter):
    def interpret(self, lines):
        text = "".join(lines)
        crashed = "Please report as 'crash'" in text
        recursive = "detected recursive call" in text
        m = re.search(
            r"by the Frama-C kernel:\s*([0-9]*)\s*error[s]?\s*([0-9]*)\s*warning", text
        )
        if crashed:
            return RESULT_UNKNOWN + "(crash)"
        if recursive:
            return RESULT_UNKNOWN + "(recursion)"
        if m:
            warnings = int(m.group(2))
            errors = int(m.group(1))
        elif "No errors or warnings raised during the analysis." in text:
            warnings = 0
            errors = 0
        else:
            return RESULT_UNKNOWN + "(nostats)"

        m = re.search("([0-9]*) alarm[s]? generated by the analysis", text)
        if m:
            alarms = int(m.group(1))
        else:
            return RESULT_UNKNOWN + "(nostats)"

        if errors + warnings + alarms == 0:
            if self.property == Property.NO_OVERFLOW:
                if "assertion 'rte,signed_overflow' got final status invalid" in text:
                    # or "signed overflow. assert" in text:
                    return RESULT_FALSE_OVERFLOW
            elif self.property == Property.MEMORY_SAFETY:
                # do not even bother to check for the existence of the other two now
                # "assertion 'alloca_bounds' got status invalid (stopping propagation)"
                # in text
                # or if "assertion 'Eva,initialization' got final status invalid"
                # in text or "accessing uninitialized left-value." in text:
                if "assertion 'rte,mem_access' got final status invalid" in text:
                    return RESULT_FALSE_DEREF
            elif self.property == Property.UNREACH_CALL:
                if "No logical properties have been reached by the analysis." in text:
                    return RESULT_TRUE_PROP
                elif " 0% of the logical properties reached have been proven." in text:
                    return RESULT_FALSE_PROP
            if (
                "No errors or warnings raised during the analysis" in text
                or "100% of the logical properties reached have been proven" in text
            ):
                return RESULT_TRUE_PROP
            else:
                return RESULT_UNKNOWN

        parts = []
        if errors > 0:
            parts.append("%d errors" % errors)
        if warnings > 0:
            parts.append("%d warnings" % warnings)
        if alarms > 0:
            parts.append("%d alarms" % alarms)
        detail = "(" + ", ".join(parts) + ")"
        return RESULT_UNKNOWN + detail


# deprecated, use ReportInterpreter instead!
class CalciumInterpreter(OutputInterpreter):
    def _interpret_no_overflow(self, lines):
        text = "".join(lines)
        has_error = "(unexpected)" if "Unexpected error" in text else None
        has_crash = "(crash)" if "Please report as 'crash'" in text else None
        is_recursive = "(recursive)" if "detected recursive call" in text else None
        unknown = has_crash or is_recursive
        m = re.search("([0-9]*) alarm[s]? generated by the analysis", text)
        alarms = 0
        if m:
            alarms = int(m.group(1))
            detail = "(%s alarms)" % m.group(1)
        if "assertion 'rte,signed_overflow' got final status invalid" in text:
            return RESULT_FALSE_OVERFLOW
        if has_error:
            return RESULT_ERROR + has_error
        if unknown:
            return RESULT_UNKNOWN + unknown
        if alarms != 0:
            return RESULT_UNKNOWN + detail
        return RESULT_TRUE_PROP

    def _interpret_unreach_call(self, lines):
        result = list(filter(lambda line: "Pre-condition 'unreach'\n" in line, lines))
        if len(result) != 1:
            return RESULT_UNKNOWN
        return RESULT_TRUE_PROP if "Valid" in result[0] else RESULT_FALSE_PROP


class ReportInterpreter(OutputInterpreter):
    def preprocess(self):
        if not report_file.is_file():
            return None
        df = pd.read_csv(report_file, delimiter="\t")
        df = df.loc[
            (df["directory"].str.endswith("output")) & (df["file"] == "program.c")
        ]
        return df[["function", "property kind", "status", "property"]]

    def interpret(self, lines):
        text = "".join(lines)
        if "Please report as 'crash'" in text:
            return RESULT_ERROR + "(crash)"
        elif "Unexpected error" in text:
            return RESULT_ERROR + "(unexpected)"
        elif "detected recursive call" in text:
            return RESULT_UNKNOWN + "(recursive)"
        else:
            return super().interpret(lines)

    def _interpret_unreach_call(self, lines):
        df = self.preprocess()
        reportlogger.info("Contents of report generated by Frama-C:\n%s" % str(df))
        if df is None or df.empty:
            return RESULT_ERROR
        df = df.loc[
            (df["function"] == "reach_error") & (df["property kind"] == "precondition")
        ]
        results = df["status"].tolist()
        if len(results) != 1:
            return RESULT_UNKNOWN
        result = results[0]
        if result == "Valid":
            return RESULT_TRUE_PROP
        elif "Invalid" in result:
            return RESULT_FALSE_PROP
        else:
            return RESULT_UNKNOWN

    def _interpret_no_overflow(self, lines):
        df = self.preprocess()
        if df is None or df.empty:
            text = "".join(lines)
            if "[eva:summary]" in text:
                return RESULT_TRUE_PROP
            else:
                return RESULT_ERROR
        overflow_props = {x for x in df["property kind"] if "overflow" in x}
        df = df[df["property kind"].isin(overflow_props)]
        results = df["status"].tolist()
        if any("Invalid" in x for x in results):
            return RESULT_FALSE_PROP
        elif all(x in ["Valid", "Dead", "Considered valid"] for x in results):
            return RESULT_TRUE_PROP
        else:
            return RESULT_UNKNOWN

    def _interpret_memory_safety(self, lines):
        df = self.preprocess()
        if df is None or df.empty:
            return RESULT_ERROR
        mem_props = {x for x in df["property kind"] if "mem_access" in x}
        df = df[df["property kind"].isin(mem_props)]
        results = df["status"].tolist()
        if any("Invalid" in x for x in results):
            return RESULT_FALSE_PROP
        elif all(x == "Valid" for x in results):
            return RESULT_TRUE_PROP
        else:
            return RESULT_UNKNOWN


def get_arch(datamodel):
    if "LP64" in datamodel:
        return "x86_64"
    else:
        return "x86_32"


def get_config(args, property_):
    """This specifies which options to run on a certain property"""
    if property_ == Property.NO_OVERFLOW or args.reach_as_overflow:
        config_file = args.config
        if os.path.exists(config_file):
            with open(config_file, "r") as file:
                content = file.read()
            return ["-eva", "-rte"] + content.split() + ["-machdep", get_arch(args.datamodel)]
        else:
            return [
                "-val",
                "-rte",
                "-eva-precision",
                "11",
                "-machdep",
                get_arch(args.datamodel),
            ]
    elif property_ == Property.UNREACH_CALL:
        inline_options = []
        try:
            try:
                from pycparserext.ext_c_parser import GnuCParser

                parser = GnuCParser()
            except ImportError:
                parser = None
            ast = pycparser.parse_file(args.program, use_cpp=True, parser=parser)
            visitor = FuncDefVisitor()
            visitor.visit(ast)
            inline_functions = visitor.func_defs.keys()
            inline_functions -= find_recursive(visitor.func_defs).union(
                {"main", "reach_error"}
            )
            if inline_functions:
                inline_options = [
                    "-inline-calls",
                    ",".join(inline_functions),
                    "-remove-inlined",
                    ",".join(inline_functions),
                ]
        except (ParseError, NotImplementedError):
            print(  # noqa T001
                "Parsing with pycparser failed, "
                "running Frama-C without function inlining"
            )
        return [
            "-wp",
            *inline_options,
            "-wp-prover",
            "coq",
            "-machdep",
            get_arch(args.datamodel),
        ]
    elif property_ == Property.MEMORY_SAFETY:
        return ["-val", "-rte", "-machdep", get_arch(args.datamodel)]
    elif property_ == Property.TERMINATION:
        return ["-val", "-rte", "-machdep", get_arch(args.datamodel)]
    else:
        raise ValueError("unknown property %s" % property_)


def run_and_interpret_framac(args):
    options = get_config(args, property_)
    cmd = (
        ["frama-c"]
        + options
        + [str(generated_program_file)]
        + [str(resource("harness.c"))]
        # + ["/usr/share/frama-c/libc/stdlib.c"]
        + ["-kernel-warn-key", "CERT:MSC:38=inactive"]
        + ["-then", "-report-csv", str(report_file)]
    )
    print(" ".join(cmd))  # noqa T001

    sys.stdout.flush()
    process = subprocess.Popen(  # noqa S603: we control cmd completely
        cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE
    )
    output = []
    for bline in iter(lambda: process.stdout.readline(), None):
        if not bline:
            break
        line = bline.decode("utf-8")
        evalogger.info(line.strip("\n"))
        output.append(line)

    frama_c_version = determine_frama_c_version()
    if "Scandium" in frama_c_version:
        output_interpreter = ScandiumInterpreter(property_)
    elif "Calcium" in frama_c_version:
        if args.reach_as_overflow:
            output_interpreter = ReportInterpreter(Property.NO_OVERFLOW)
        else:
            output_interpreter = ReportInterpreter(property_)
    else:
        output_interpreter = ReportInterpreter(property_)
        #raise NotImplementedError(
        #    f"Output interpretation for version {frama_c_version} is not yet supported!"
        #)

    return output_interpreter.interpret(output)


def instrument_program(args, property_):
    new_text = ""
    if property_ is Property.MEMORY_SAFETY:
        new_text = "#include <stddef.h>\n"
        new_text += "\n"
        new_text += "extern void *__builtin_alloca(size_t);\n"
        new_text += "extern double __builtin_huge_val(void);\n"
        new_text += "extern float __builtin_huge_valf(void);\n"
        new_text += "extern float __builtin_inff(void);\n"
        new_text += "extern float __builtin_nan(const char*);\n"
        new_text += "extern float __builtin_nanf(const char*);\n"
        new_text += "extern void *__builtin_memcpy(void*, const void*, size_t);\n"
        new_text += "extern void *__builtin_memset(void*, int, size_t);\n"
        new_text += "extern void *__builtin_memmove(void*, const void*, size_t);\n"

    with open(args.program, "r") as program:
        new_text += "".join(program.readlines())

    if not args.reach_as_overflow:
        new_text = re.sub(
            r"void\s+reach_error",
            "/*@ requires unreach: \\\\false;*/ void reach_error",
            new_text,
        )
    else:
        new_text = re.sub(
            r"void\s+reach_error\(\s*(void)?\s*\)\s*{",
            "void reach_error() {int __fc_unreach_test = ((int)-2147483648)*-1;",
            new_text,
        )
    return new_text


if __name__ == "__main__":
    logging.basicConfig()

    evalogger = logging.getLogger("FRAMAC")
    evalogger.setLevel(logging.INFO)
    reportlogger = logging.getLogger("REPORT")
    reportlogger.setLevel(logging.INFO)
    resultlogger = logging.getLogger("RESULT")
    resultlogger.setLevel(logging.INFO)

    args = parse_args()

    if args.version:
        print(VERSIONSTRING)  # noqa T001
        sys.exit()

    # dirty hack to get why3 solvers working when benchmarking on vcloud:
    subprocess.call(  # noqa S603 we control cmd completely S607 it's a hack
        ["why3", "config", "--detect"]
    )

    resource(OUT_DIR).mkdir(parents=True, exist_ok=True)
    report_file = resource(OUT_DIR, "report.csv")
    generated_program_file = resource(OUT_DIR, "program.c")

    for f in (report_file, generated_program_file):
        if f.exists():
            f.unlink()

    with open(args.property, "r") as prop_file:
        property_text = prop_file.read()
        property_ = Property.from_text(property_text)

    with open(generated_program_file, "w") as f:
        f.write(instrument_program(args, property_))

    result = run_and_interpret_framac(args)

    if result is RESULT_FALSE_PROP and args.reach_as_overflow:
        result = RESULT_UNKNOWN

    create_witness(result)
    resultlogger.info(result)
