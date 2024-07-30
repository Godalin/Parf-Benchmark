#!/bin/sh

timelimit="10m"
logfile="log_eva_official"

# Preprocessing arguments for -cpp-extra-args
cppargs="-D__FRAMAC__EVA"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva \
  -eva-warn-key builtins:missing-spec=abort \
  -eva-no-alloc-returns-null \
  -main eva_main \
  -eva-slevel 2" 

# Analysis Targets: source files
target1="../kilo.c \
  fc_stubs.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
