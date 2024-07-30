#!/bin/sh

timelimit="60m"
logfile="log_eva_expert"

# Preprocessing arguments for -cpp-extra-args
cppargs="-include__fc_builtin.h \
  -D_POSIX_C_SOURCE=200809L"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva -eva-precision" 

# Analysis Targets: source files
target1="../*.c \
  $(frama-c-config -print-share-path)/libc/string.c \
  $(frama-c-config -print-share-path)/libc/netdb.c \
  fc_stubs.c"

cmd1="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams \$n $target1
done"

(time timeout $timelimit bash -c "$cmd1") 1> $logfile 2>&1
