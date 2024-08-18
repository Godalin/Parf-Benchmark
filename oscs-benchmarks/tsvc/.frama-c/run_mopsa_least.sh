#!/bin/bash

timelimit="20m"
logfile="log_mopsa_least"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="-max-set-size 1 -numeric lineq -loop-unrolling 1 -widening-delay 0"

# Analysis Targets: source files
target1="../dummy.c ../tsvc.c"



cmd1="mopsa-c $cppargs $mopsaparams $target1"

$cmd1 1> $logfile 2>&1
