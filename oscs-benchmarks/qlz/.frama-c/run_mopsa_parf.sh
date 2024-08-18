#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

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
mopsaparams1="" 
mopsaparams2="" 
mopsaparams3="" 
mopsaparams4="" 

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

cmd1=parfext" $cppargs $mopsaparams $target1"
cmd2=parfext" $cppargs $mopsaparams $target1"
cmd3=parfext" $cppargs $mopsaparams $target1"
cmd4=parfext" $cppargs $mopsaparams $target1"

$cmd1 1> $logfile 2>&1
$cmd2 1>> $logfile 2>&1
$cmd3 1>> $logfile 2>&1
$cmd4 1>> $logfile 2>&1
