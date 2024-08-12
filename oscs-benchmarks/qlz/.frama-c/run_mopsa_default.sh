#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs1=""
cppargs2=""
cppargs3=""
cppargs4=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams1="-eva" 
mopsaparams2="-eva" 
mopsaparams3="-eva" 
mopsaparams4="-eva" 

# Analysis Targets: source files
target1="../compress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"
target4="../stream_decompress.c \
  ../quicklz.c \
  fc_stubs.c"

cmd1="mopsa-c $cppargs1 $mopsaparams1 $target1"
cmd2="mopsa-c $cppargs2 $mopsaparams2 $target2"
cmd3="mopsa-c $cppargs3 $mopsaparams3 $target3"
cmd4="mopsa-c $cppargs4 $mopsaparams4 $target4"

timeout $timelimit $cmd1 1> $logfile 2>&1
timeout $timelimit $cmd2 1>> $logfile 2>&1
timeout $timelimit $cmd3 1>> $logfile 2>&1
timeout $timelimit $cmd4 1>> $logfile 2>&1
