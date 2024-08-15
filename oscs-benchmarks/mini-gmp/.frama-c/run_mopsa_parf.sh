#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I .."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="\
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -main testmain"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../tests/testutils.c \
  ../tests/t-add.c \
  ../tests/hex-random.c \
  ../tests/mini-random.c \
  fc_stubs.h"

cmd1=parfext"$cppargs $mopsaparams $target1"

timeout $timelimit $cmd1 1> $logfile 2>&1
