#!/bin/sh

timelimit="10m"
logfile="log_eva_default"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva" 

# Analysis Targets: source files
target1="fc_stubs.c \
  ../examples/simple.c"
target2="fc_stubs.c \
  ../examples/full_api.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"
cmd2="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target2"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
