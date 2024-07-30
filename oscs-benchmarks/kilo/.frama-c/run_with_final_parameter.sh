#!/bin/sh

timelimit="62m"
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 parameter logFile"  
    exit 1  
fi
parameter=$1
logFile=$2

# Preprocessing arguments for -cpp-extra-args
cppargs="-D__FRAMAC__EVA"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva $parameter" 

# Analysis Targets: source files
target1="../kilo.c \
  fc_stubs.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
