#!/bin/bash

timelimit="20m"
logfile="log_mopsa_least"

# Preprocessing arguments for -cpp-extra-args


cppargs3=""


# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here


mopsaparams3="-max-set-size 1 -numeric lineq -loop-unrolling 1 -widening-delay 0" 


# Analysis Targets: source files
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"





cmd3="mopsa-c $cppargs3 $mopsaparams3 $target3"




$cmd3 1> $logfile 2>&1

