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
cppargs1=""
cppargs2=""
cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"
cppargs4="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific parf parameters
parfparams1="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 
parfparams2="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 
parfparams3="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 
parfparams4="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 

# Analysis Targets: source files
target1="../compress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"
target4="../stream_decompress.c \
  ../quicklz.c \
  fc_stubs.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs1\" $kernelparams $parfparams1 $target1"
cmd2="dune exec -- frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $parfparams2 $target2"
cmd3="dune exec -- frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $parfparams3 $target3"
cmd4="dune exec -- frama-c -cpp-extra-args=\"$cppargs4\" $kernelparams $parfparams4 $target4"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd2) 1>> $logFile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd3) 1>> $logFile 2>&1"
#rm -rf parf_temp_files
eval "(time timeout $timelimit $cmd4) 1>> $logFile 2>&1"
#rm -rf parf_temp_files
