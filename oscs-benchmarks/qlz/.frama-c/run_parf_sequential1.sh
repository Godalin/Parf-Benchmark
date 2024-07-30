#!/bin/sh

timelimit="32m"
logfile="log_parf_sequential_expr1"

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

# Specific parf parameters
parfparams1="-parf -parf-budget 1800" 
parfparams2="-parf -parf-budget 1800" 
parfparams3="-parf -parf-budget 1800" 
parfparams4="-parf -parf-budget 1800" 

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

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs1\" $kernelparams $parfparams1 $target1"
cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $parfparams2 $target2"
cmd3="dune exec -- frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $parfparams3 $target3"
cmd4="dune exec -- frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $parfparams4 $target4"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd3) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd4) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
