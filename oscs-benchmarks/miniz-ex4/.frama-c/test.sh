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



evaparams4="-eva -eva-precision 5" 



# Analysis Targets: source files
target4="stubs.c \
  ../examples/example4.c \
  ../miniz.c \
  ../miniz_tinfl.c"




cmd4="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams4 $target4"




