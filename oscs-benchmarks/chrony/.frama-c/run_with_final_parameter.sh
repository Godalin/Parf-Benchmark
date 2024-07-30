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
  -D_XOPEN_SOURCE=200112L \
  -DNB_TESTS=3"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-cpp-command \"gcc -E -C -I..\" \
  -cpp-frama-c-compliant \
  -add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva $parameter" 

# Analysis Targets: source files
target1="\
  ../test/unit/test.c \
  $(frama-c-config -print-share-path)/libc/string.c \
  $(frama-c-config -print-share-path)/libc/stdlib.c \
  $(frama-c-config -print-share-path)/libc/stdio.c \
  $(frama-c-config -print-share-path)/libc/glob.c \
  $(frama-c-config -print-share-path)/libc/netdb.c \
  ../addrfilt.c \
  ../array.c \
  ../clientlog.c \
  ../cmdparse.c \
  ../conf.c \
  ../hash_intmd5.c \
  ../keys.c \
  ../local.c \
  ../memory.c \
  ../nameserv.c \
  ../ntp_io.c \
  ../reference.c \
  ../regress.c \
  ../sched.c \
  ../smooth.c \
  ../sources.c \
  ../sourcestats.c \
  ../util.c \
  ../stubs.c \
  fc_stubs.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
