#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../code/harness -I ../code -I ../code/intel/linux"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../code/*.c \
  ../code/harness/harness.c \
  ../code/intel/linux/target.c"

cmd1=parfext"$cppargs $mopsaparams $target1"

timeout $timelimit $cmd1 1> $logfile 2>&1
