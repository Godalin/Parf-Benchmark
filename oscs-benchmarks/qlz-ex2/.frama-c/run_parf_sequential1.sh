#!/bin/sh

timelimit="32m"
logfile="log_parf_sequential_expr1"

# Preprocessing arguments for -cpp-extra-args

cppargs2=""



# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific parf parameters

parfparams2="-parf -parf-budget 1800" 



# Analysis Targets: source files
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"


cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $parfparams2 $target2"





eval "(time timeout $timelimit $cmd2) 1> $logfile 2>&1"





