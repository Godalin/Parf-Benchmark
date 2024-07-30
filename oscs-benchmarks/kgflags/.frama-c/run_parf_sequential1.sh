#!/bin/sh

timelimit="32m"
logfile="log_parf_sequential_expr1"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific parf parameters
parfparams="-parf -parf-budget 1800" 

# Analysis Targets: source files
target1="fc_stubs.c \
  ../examples/simple.c"
target2="fc_stubs.c \
  ../examples/full_api.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"
cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target2"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
