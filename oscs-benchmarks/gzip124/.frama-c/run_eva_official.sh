#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

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
old_evaparams="-eva \
  -eva-slevel 4 \
  -eva-no-alloc-returns-null \
  -eva-no-builtins-auto \
  -eva-widening-delay 3 \
  -eva-widening-period 3"
evaparams="-eva \
  -eva-slevel 4 \
  -eva-widening-delay 3 \
  -eva-widening-period 3"

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
cmd1="frama-c -cpp-extra-args=\"$cppargs\" $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
