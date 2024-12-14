#!/bin/sh

timelimit="32m"
logfile="log_parf_parallel_expr"

# Preprocessing arguments for -cpp-extra-args



cppargs4="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific parf parameters



parfparams4="-parf -parf-budget 1800 -parf-process 4" 

# Analysis Targets: source files
target4="../stream_decompress.c \
  ../quicklz.c \
  fc_stubs.c"




cmd4="dune exec -- frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $parfparams4 $target4"







eval "(time timeout $timelimit $cmd4) 1> $logfile 2>&1"

