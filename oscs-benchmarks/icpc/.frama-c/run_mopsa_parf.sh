#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:."

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../src/impls.c \
  ../src/roco.c \
  ../src/sim.c \
  ../src/main.c"

cmd1=parfext"$cppargs $mopsaparams $target1"

$cmd1 1> $logfile 2>&1
