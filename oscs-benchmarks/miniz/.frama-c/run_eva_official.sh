#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

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
evaparams1="-eva -eva-warn-key builtins:missing-spec=abort" 
evaparams2="-eva -eva-warn-key builtins:missing-spec=abort" 
evaparams3="-eva -eva-warn-key builtins:missing-spec=abort" 
evaparams4="-eva -eva-warn-key builtins:missing-spec=abort" 
evaparams5="-eva -eva-warn-key builtins:missing-spec=abort" 
evaparams6="-eva -eva-warn-key builtins:missing-spec=abort" 

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

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams1 $target1"
cmd2="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams2 $target2"
cmd3="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams3 $target3"
cmd4="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams4 $target4"
cmd5="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams5 $target5"
cmd6="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams6 $target6"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd3) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd4) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd5) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd6) 1>> $logfile 2>&1"