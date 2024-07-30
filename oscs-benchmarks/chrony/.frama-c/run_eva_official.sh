#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs="\
  -D_XOPEN_SOURCE=200112L \
  -DNB_TESTS=3"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-cpp-command \"gcc -E -C -I..\" \
  -cpp-frama-c-compliant \
  -add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -warn-special-float none"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva \
  -eva-mlevel 1 \
  -eva-use-spec atoi,malloc,free,calloc,Transform,parse_include,SCH_AddTimeout \
  -eva-warn-key=alarm \
  -eva-malloc-functions malloc,realloc,Malloc,Malloc2,Realloc,Realloc2 \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-warn-key malloc:weak \
  -eva-domains equality,gauges \
  -eva-domains-function symbolic-locations:prune_register \
  -eva-domains-function symbolic-locations:SST_DoNewRegression \
  -eva-domains-function symbolic-locations:SST_AccumulateSample \
  -eva-domains-function symbolic-locations:find_min_delay_sample \
  -eva-domains-function symbolic-locations:UTI_NormaliseTimespec \
  -eva-domains-function symbolic-locations:estimate_asymmetry" 

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

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
