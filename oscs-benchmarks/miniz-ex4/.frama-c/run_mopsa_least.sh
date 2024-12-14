#!/bin/bash

timelimit="20m"
logfile="log_mopsa_least"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I .."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here



mopsaparams4="-max-set-size 1 -numeric lineq -loop-unrolling 1 -widening-delay 0" 



# Analysis Targets: source files
target4="stubs.c \
  ../examples/example4.c \
  ../miniz.c \
  ../miniz_tinfl.c"






cmd4="mopsa-c $cppargs $mopsaparams4 $target4"






$cmd4 1> $logfile 2>&1


