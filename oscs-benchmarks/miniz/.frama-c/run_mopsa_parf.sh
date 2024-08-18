#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I .."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams1="" 
mopsaparams2="" 
mopsaparams3="" 
mopsaparams4="" 
mopsaparams5="" 
mopsaparams6="" 

# Analysis Targets: source files
target1="stubs.c \
  ../examples/example1.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target2="stubs.c \
  ../examples/example2.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c \
  ../miniz_zip.c"
target3="stubs.c \
  ../examples/example3.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target4="stubs.c \
  ../examples/example4.c \
  ../miniz.c \
  ../miniz_tinfl.c"
target5="stubs.c \
  ../examples/example5.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target6="stubs.c \
  ../examples/example6.c \
  ../miniz.c \
  ../miniz_tdef.c"

cmd1=parfext" $cppargs $mopsaparams $target1"
cmd2=parfext" $cppargs $mopsaparams $target1"
cmd3=parfext" $cppargs $mopsaparams $target1"
cmd4=parfext" $cppargs $mopsaparams $target1"
cmd5=parfext" $cppargs $mopsaparams $target1"
cmd6=parfext" $cppargs $mopsaparams $target1"

parfext "$cppargs $mopsaparams $target1" > $logfile
parfext "$cppargs $mopsaparams $target2" >> $logfile
parfext "$cppargs $mopsaparams $target3" >> $logfile
parfext "$cppargs $mopsaparams $target4" >> $logfile
parfext "$cppargs $mopsaparams $target5" >> $logfile
parfext "$cppargs $mopsaparams $target6" >> $logfile
