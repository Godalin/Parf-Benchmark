#!/bin/sh

timelimit="62m"
if [ "$#" -ne 5 ]; then  
    echo "Usage: $0 timeBudget processCore sampleNum refineNum logFile"  
    exit 1  
fi
timeBudget=$1  
processCore=$2  
sampleNum=$3  
refineNum=$4  
logFile=$5 

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific parf parameters
parfparams="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 

# Analysis Targets: source files
target1="fc_stubs.c \
  ../examples/simple.c"
target2="fc_stubs.c \
  ../examples/full_api.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"
cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target2"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd2) 1>> $logFile 2>&1"
#rm -rf parf_temp_files
