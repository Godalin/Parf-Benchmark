#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -warn-special-float none"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva \
  -eva-slevel 16 \
  -eva-domains equality" 

# Analysis Targets: source files
target1="../src/impls.c \
  ../src/roco.c \
  ../src/sim.c \
  ../src/main.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
