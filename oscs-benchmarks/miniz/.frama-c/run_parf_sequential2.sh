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
parfparams1="-parf -parf-budget 1800" 
parfparams2="-parf -parf-budget 1800" 
parfparams3="-parf -parf-budget 1800" 
parfparams4="-parf -parf-budget 1800" 
parfparams5="-parf -parf-budget 1800" 
parfparams6="-parf -parf-budget 1800" 

# Analysis Targets: source files
target1="stubs.c \
  ../examples/example1.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target2="stubs.c \
  ../examples/example2.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c \
  ../miniz_zip.c"
target3="stubs.c \
  ../examples/example3.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target4="stubs.c \
  ../examples/example4.c \
  ../miniz.c \
  ../miniz_tinfl.c"
target5="stubs.c \
  ../examples/example5.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"
target6="stubs.c \
  ../examples/example6.c \
  ../miniz.c \
  ../miniz_tdef.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams1 $target1"
cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams2 $target2"
cmd3="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams3 $target3"
cmd4="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams4 $target4"
cmd5="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams5 $target5"
cmd6="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams6 $target6"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd2) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd3) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd4) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd5) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd6) 1>> $logfile 2>&1"
#rm -rf parf_temp_files
