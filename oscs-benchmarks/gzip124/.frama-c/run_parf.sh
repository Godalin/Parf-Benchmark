#!/bin/sh

timelimit="62m"
if [ "$#" -ne 5 ]; then  
    echo "Usage: $0 timeBudget processCore sampleNum refineNum logFile"  
    exit 1  
fi
timeBudget=$1  
processCore=$2  
sampleNum=$3  
refineNum=$4  
logFile=$5 

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
parfparams="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 

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

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
#rm -rf parf_temp_files
