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


evaparams3="-eva -eva-precision 5" 




# Analysis Targets: source files
target3="stubs.c \
  ../examples/example3.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"



cmd3="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams3 $target3"





