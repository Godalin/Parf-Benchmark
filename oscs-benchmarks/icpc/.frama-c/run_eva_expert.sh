#!/bin/sh

timelimit="60m"
logfile="log_eva_expert"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:."

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva -eva-precision" 

# Analysis Targets: source files
target1="../src/impls.c \
  ../src/roco.c \
  ../src/sim.c \
  ../src/main.c"

cmd1="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams \$n $target1
done"

(time timeout $timelimit bash -c "$cmd1") 1> $logfile 2>&1
