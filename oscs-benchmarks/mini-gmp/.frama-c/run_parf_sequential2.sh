#!/bin/sh

timelimit="32m"
logfile="log_parf_sequential_expr2"

# Preprocessing arguments for -cpp-extra-args
cppargs="-std=c99 \
  -I.. \
  -D__gmp_asprintf=asprintf"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="\
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -main testmain"

# Specific parf parameters
parfparams="-parf -parf-budget 1800" 

# Analysis Targets: source files
target1="$(frama-c-config -print-share-path)/libc/stdio.c \
  ../tests/testutils.c \
  ../tests/t-add.c \
  ../tests/hex-random.c \
  ../tests/mini-random.c \
  fc_stubs.h"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
