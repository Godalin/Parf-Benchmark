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
evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null \
  -eva-slevel 300"

evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-slevel 300"

# Analysis Targets: source files
target1="../test/tests.c"
target2="../jsmn.c \
  ../example/simple.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"
cmd2="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target2"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $evaparams $target1"
cmd2="frama-c -cpp-extra-args=\"$cppargs\" $evaparams $target2"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
