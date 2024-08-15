#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../MIPSDK/C/Library/Include -I ../include/microstrain_mips -I ../MIPSDK/C/Utilities/Include"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="fc_stubs.c \
  ../MIPSDK/C/Library/Source/*.c \
  ../MIPSDK/C/Utilities/Source/byteswap_utilities.c \
  ../src/mip_sdk_user_functions.c \
  ../MIPSDK/C/Examples/Linux/GX4-45/GX4_45_Test/GX4-45_Test.c"

cmd1="parfext \"mopsa-c $cppargs $mopsaparams $target1\""

timeout $timelimit $cmd1 1> $logfile 2>&1
