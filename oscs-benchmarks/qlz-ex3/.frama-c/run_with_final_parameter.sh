#!/bin/sh

timelimit="62m"
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 parameter logFile"  
    exit 1  
fi
parameter=$1
logFile=$2

# Preprocessing arguments for -cpp-extra-args


cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"


# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here


evaparams3="-eva $parameter" 


# Analysis Targets: source files
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"



cmd3="frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $evaparams3 $target3"




eval "(time timeout $timelimit $cmd3) 1> $logfile 2>&1"

