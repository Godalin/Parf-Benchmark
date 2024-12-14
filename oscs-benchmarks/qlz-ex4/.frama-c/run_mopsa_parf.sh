#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args



cppargs4=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here



mopsaparams4="" 

# Analysis Targets: source files
target4="../stream_decompress.c \
  ../quicklz.c \
  fc_stubs.c"




cmd4=parfext" $cppargs $mopsaparams $target1"

parfext "$cppargs $mopsaparams $target4" > $logfile
