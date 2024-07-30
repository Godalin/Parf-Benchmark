#!/bin/sh

timelimit="62m"
if [ "$#" -ne 2 ]; then  
    echo "Usage: $0 parameter logFile"  
    exit 1  
fi
parameter=$1
logFile=$2

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

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva $parameter" 

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

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
