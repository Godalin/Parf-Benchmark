#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../*.c fc_stubs.c"

cmd1="mopsa-c $cppargs $mopsaparams $target1"

timeout $timelimit $cmd1 1> $logfile 2>&1
