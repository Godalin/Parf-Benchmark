#!/bin/sh

timelimit="62m"
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 parameter logFile"  
    exit 1  
fi
parameter=$1
logFile=$2

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

evaparams2="-eva $parameter" 



# Analysis Targets: source files
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"


cmd2="frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $evaparams2 $target2"




eval "(time timeout $timelimit $cmd2) 1> $logfile 2>&1"


