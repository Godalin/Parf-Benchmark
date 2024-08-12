#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I../include/ \
  -I../safeclib/"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva -eva-precision 3" 

# Analysis Targets: source files
target1="../safeclib/*.c ../unittests/*.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"