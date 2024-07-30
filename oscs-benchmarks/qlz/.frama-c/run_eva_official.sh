#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

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
evaparams1="-eva -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null"
evaparams2="-eva -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null"
evaparams3="-eva -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null"
evaparams4="-eva -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null"

evaparams1="-eva -eva-warn-key builtins:missing-spec=abort"
evaparams2="-eva -eva-warn-key builtins:missing-spec=abort"
evaparams3="-eva -eva-warn-key builtins:missing-spec=abort"
evaparams4="-eva -eva-warn-key builtins:missing-spec=abort"

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

cmd1="frama-c -cpp-extra-args=\"$cppargs1\" $kernelparams $evaparams1 $target1"
cmd2="frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $evaparams2 $target2"
cmd3="frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $evaparams3 $target3"
cmd4="frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $evaparams4 $target4"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd3) 1>> $logfile 2>&1"
eval "(time timeout $timelimit $cmd4) 1>> $logfile 2>&1"
