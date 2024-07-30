#!/bin/sh

timelimit="32m"
logfile="log_parf_parallel_expr"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific parf parameters
parfparams="-parf -parf-budget 1800 -parf-process 4" 

# Analysis Targets: source files
target1="../stmr.c \
  ../test.c \
  $(frama-c-config -print-share-path)/libc/stdio.c \
  $(frama-c-config -print-share-path)/libc/string.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
