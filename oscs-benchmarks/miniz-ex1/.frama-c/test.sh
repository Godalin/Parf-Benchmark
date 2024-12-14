#!/bin/sh

timelimit="10m"
logfile="log_eva_precision5"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I.."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams1="-eva -eva-precision 3 " 






# Analysis Targets: source files
target1="stubs.c \
  ../examples/example1.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams1 $target1"






eval "(time timeout $timelimit $cmd1) 1> log_test 2>&1"
