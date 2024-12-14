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


parfparams3="-parf -parf-budget 1800" 




# Analysis Targets: source files
target3="stubs.c \
  ../examples/example3.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"



cmd3="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams3 $target3"








eval "(time timeout $timelimit $cmd3) 1> $logfile 2>&1"







