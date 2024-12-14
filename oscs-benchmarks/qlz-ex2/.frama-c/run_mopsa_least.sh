#!/bin/bash

timelimit="20m"
logfile="log_mopsa_least"

# Preprocessing arguments for -cpp-extra-args

cppargs2=""



# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here

mopsaparams2="-max-set-size 1 -numeric lineq -loop-unrolling 1 -widening-delay 0" 



# Analysis Targets: source files
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"




cmd2="mopsa-c $cppargs2 $mopsaparams2 $target2"




$cmd2 1> $logfile 2>&1


