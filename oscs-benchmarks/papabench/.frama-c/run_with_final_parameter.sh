#!/bin/sh

timelimit="62m"
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 parameter logFile"  
    exit 1  
fi
parameter=$1
logFile=$2

# Preprocessing arguments for -cpp-extra-args
cppargs="-DUBX \
  -D__FAKE_FOR_IA32__ \
  -D_XOPEN_SOURCE=700 \
  -I../sw/airborne/fly_by_wire \
  -I../sw/var/include \
  -I../sw/airborne/autopilot \
  -I../avr/include \
  -I../sw/include"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva $parameter" 

# Analysis Targets: source files
target1="../sw/airborne/autopilot/*.c \
  ../sw/lib/c/pp_math.c \
  $(frama-c-config -print-share-path)/libc/math.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"