#!/bin/sh

timelimit="60m"
logfile="log_eva_expert"

# Preprocessing arguments for -cpp-extra-args
cppargs1=""
cppargs2=""
cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"
cppargs4="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams1="-eva -eva-precision" 
evaparams2="-eva -eva-precision" 
evaparams3="-eva -eva-precision" 
evaparams4="-eva -eva-precision" 

# Analysis Targets: source files
target1="../compress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"
target4="../stream_decompress.c \
  ../quicklz.c \
  fc_stubs.c"

cmd1="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs1\" $kernelparams $evaparams1 \$n $target1
done"
cmd2="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $evaparams2 \$n $target2
done"
cmd3="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $evaparams3 \$n $target3
done"
cmd4="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $evaparams4 \$n $target4
done"

(time timeout $timelimit bash -c "$cmd1") 1> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd2") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd3") 1>> $logfile 2>&1
(time timeout $timelimit bash -c "$cmd4") 1>> $logfile 2>&1
