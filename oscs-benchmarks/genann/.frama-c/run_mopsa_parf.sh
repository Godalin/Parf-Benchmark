#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams=""

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../genann.c \
  ../test.c"

cmd1="parfext \"mopsa-c $cppargs $mopsaparams $target1\""

timeout $timelimit $cmd1 1> $logfile 2>&1
