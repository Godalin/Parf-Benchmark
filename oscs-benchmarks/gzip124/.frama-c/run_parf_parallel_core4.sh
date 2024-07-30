#!/bin/sh

timelimit="32m"
logfile="log_parf_parallel_expr"

# Preprocessing arguments for -cpp-extra-args
cppargs="\
  -include$(frama-c-config -print-share-path)/libc/string.h \
  -DSTDC_HEADERS=1 \
  -DHAVE_UNISTD_H=1 \
  -DDIRENT=1 \
  -DNO_UTIME=1 \
  -I$(frama-c-config -print-share-path)/libc"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams=""

# Specific parf parameters
parfparams="-parf -parf-budget 1800 -parf-process 4" 

# Analysis Targets: source files
target1="../gzip.c \
  ../zip.c \
  ../deflate.c \
  ../trees.c \
  ../bits.c \
  ../unzip.c \
  ../inflate.c \
  ../util.c \
  ../crypt.c \
  ../lzw.c \
  ../unlzw.c \
  ../unpack.c \
  ../unlzh.c \
  ../getopt.c \
  $(frama-c-config -print-share-path)/libc/stdlib.c \
  fc_stubs.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
