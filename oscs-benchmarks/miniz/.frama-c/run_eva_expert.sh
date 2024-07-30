#!/bin/sh

timelimit="60m"
logfile="log_eva_expert"

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
evaparams1="-eva -eva-precision" 
evaparams2="-eva -eva-precision" 
evaparams3="-eva -eva-precision" 
evaparams4="-eva -eva-precision" 
evaparams5="-eva -eva-precision" 
evaparams6="-eva -eva-precision" 

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

cmd1="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams1 \$n $target1
done"
cmd2="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams2 \$n $target2
done"
cmd3="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams3 \$n $target3
done"
cmd4="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams4 \$n $target4
done"
cmd5="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams5 \$n $target5
done"
cmd6="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams6 \$n $target6
done"

(time timeout $timelimit bash -c "$cmd1") 1> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd2") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd3") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd4") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd5") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd6") 1>> $logfile 2>&1
