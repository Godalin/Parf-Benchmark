#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams=""

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-slevel 9" 

# Analysis Targets: source files
target1="../genann.c \
  ../test.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
eval $cmd2
