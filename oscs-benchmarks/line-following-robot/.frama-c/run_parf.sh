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
cppargs="-I../avr-libc/include \
  -D__AVR_ATmega328P__ \
  -DF_CPU=1000000UL \
  -D__OPTIMIZE__ \
  -I../avr-libc/"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key linker:drop-conflicting-unused=inactive \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -absolute-valid-range 0x0020-0x08ff"

# Specific parf parameters
parfparams="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 

# Analysis Targets: source files
target1="../sources/main.c \
  ../avr-libc/libc/stdio/iob.c \
  ../sources/eeprom_stubs.c \
  ../sources/avr_stubs.c"

cmd1="dune exec -- frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
#rm -rf parf_temp_files
