#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../sw/airborne/fly_by_wire \
  -I ../sw/var/include \
  -I ../sw/airborne/autopilot \
  -I ../avr/include \
  -I ../sw/include"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../sw/airborne/autopilot/*.c \
  ../sw/lib/c/pp_math.c"

cmd1="mopsa-c $cppargs $mopsaparams $target1"

logfile="log_mopsa_least"
mopsaparams="-max-set-size 1 -numeric lineq -loop-unrolling 1 -widening-delay 0"


$cmd1 1> $logfile 2>&1
