#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs="-CC"

# General kernel parameters
## Please add kernel parameters here if necessary
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -warn-left-shift-negative \
  -warn-right-shift-negative \
  -warn-signed-downcast \
  -warn-signed-overflow \
  -warn-unsigned-downcast \
  -warn-unsigned-overflow"

# Specific eva parameters
## Please add high-precision eva parameters here
old_evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-warn-undefined-pointer-comparison none \
  -eva-precision 2"
evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-precision 2"

# Analysis Targets: source files
target1="../src/x509-parser.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
