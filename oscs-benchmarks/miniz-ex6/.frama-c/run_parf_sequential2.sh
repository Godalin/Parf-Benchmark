#!/bin/sh

timelimit="32m"
logfile="log_parf_sequential_expr2"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I.."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific parf parameters





parfparams6="-parf -parf-budget 1800" 

# Analysis Targets: source files
target6="stubs.c \
  ../examples/example6.c \
  ../miniz.c \
  ../miniz_tdef.c"






cmd6="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams6 $target6"











eval "(time timeout $timelimit $cmd6) 1> $logfile 2>&1"

