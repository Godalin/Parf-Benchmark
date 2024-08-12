#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I .."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-cpp-command \"gcc -E -C -I..\" \
  -cpp-frama-c-compliant \
  -add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="\
  ../test/unit/test.c \
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

cmd1="mopsa-c $cppargs $mopsaparams $target1"

timeout $timelimit $cmd1 1> $logfile 2>&1
