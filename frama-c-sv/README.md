<!--
This file is part of frama-c-svcomp,
a wrapper around Frama-C that makes it possible
to execute Frama-C as part of the Competition on Software Verification:
https://gitlab.com/sosy-lab/software/frama-c-svcomp

SPDX-FileCopyrightText: 2020 Dirk Beyer <https://www.sosy-lab.org>

SPDX-License-Identifier: Apache-2.0
-->

# frama-c-svcomp

This is an **experimental** wrapper around Frama-C to make it possible to execute Frama-C as part of the Competition on Software Verification.
It is a separate tool from Frama-C and not to be confused with it.
It is **not** provided by the authors of Frama-C but instead a separate tool that build upon Frama-C as its main component.

This is still a work in progress, expect bugs and frequently changing code base.

In case you find any issues, feel encouraged to report them at the issue tracker
at https://gitlab.com/sosy-lab/software/frama-c-sv/-/issues

# Installation and Dependencies

We require the following packages (on an Ubuntu 20.04 installation):

- frama-c-base
- python3-pycparser
- why3
- why3-coq
- libwhy3-ocaml-dev

Other linux distributions might work as well, but this is not tested.

As of 2021-12-13, the required packages have the following versions on Ubuntu 20.04:

- frama-c-base: 20191204+calcium-0.1
- python3-pycparser: 2.19-1ubuntu1
- why3: 1.2.1-6
- why3-coq: 1.2.1-6
- libwhy3-ocaml-dev: 1.2.1-6
