#!/bin/sh

timelimit="32m"
logfile="log_parf_parallel_expr"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I.."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific parf parameters




parfparams5="-parf -parf-budget 1800 -parf-process 4" 


# Analysis Targets: source files
target5="stubs.c \
  ../examples/example5.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"





cmd5="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams5 $target5"










eval "(time timeout $timelimit $cmd5) 1> $logfile 2>&1"



