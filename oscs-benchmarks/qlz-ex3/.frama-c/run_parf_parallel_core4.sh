#!/bin/sh

timelimit="32m"
logfile="log_parf_parallel_expr"

# Preprocessing arguments for -cpp-extra-args


cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"


# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific parf parameters


parfparams3="-parf -parf-budget 1800 -parf-process 4" 


# Analysis Targets: source files
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"



cmd3="dune exec -- frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $parfparams3 $target3"






eval "(time timeout $timelimit $cmd3) 1> $logfile 2>&1"



