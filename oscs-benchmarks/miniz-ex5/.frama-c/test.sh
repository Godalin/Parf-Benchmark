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




evaparams5="-eva -eva-precision 5" 


# Analysis Targets: source files
target5="stubs.c \
  ../examples/example5.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"





cmd5="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams5 $target5"



