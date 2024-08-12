#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../code/harness -I ../code -I ../code/intel/linux \
               -DTRACE_HARNESS -DTRACE_TARGET"

# General kernel parameters
## Please add kernel parameters here if necessary
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-domains equality \
  -eva-auto-loop-unroll 180"

evaparams="-eva \
  -eva-domains equality \
  -eva-auto-loop-unroll 180"

# Analysis Targets: source files
target1="../code/*.c \
  ../code/harness/harness.c \
  ../code/intel/linux/target.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"