#!/bin/sh

# Default values for parameters (can be overridden by command-line arguments)
default_timelimit="10m"
default_logfile="log_eva_precision0"

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --timelimit=*)
            timelimit="${1#*=}"
            ;;
        --logfile=*)
            logfile="${1#*=}"
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Set defaults if not provided
timelimit="${timelimit:-$default_timelimit}"
logfile="${logfile:-$default_logfile}"

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
evaparams="-eva -eva-precision 0" 

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

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
