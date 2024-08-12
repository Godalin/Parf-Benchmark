#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
#evaparams="-eva \
#  -eva-warn-key builtins:missing-spec=abort \
#  -eva-no-alloc-returns-null"
evaparams="-eva -eva-warn-key builtins:missing-spec=abort"
# Analysis Targets: source files
target1="../khash.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"
cmd1="frama-c -cpp-extra-args=\"$cppargs\" $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"