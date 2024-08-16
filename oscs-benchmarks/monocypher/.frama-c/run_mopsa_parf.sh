#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../src -I ../src/optional"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../src/monocypher.c \
  ../src/optional/sha512.c \
  ../tests/test.c"

cmd1=parfext"$cppargs $mopsaparams $target1"

$cmd1 1> $logfile 2>&1
