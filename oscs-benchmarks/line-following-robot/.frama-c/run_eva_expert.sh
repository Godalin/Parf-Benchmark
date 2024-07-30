#!/bin/sh

timelimit="60m"
logfile="log_eva_expert"

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

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva -eva-precision" 

# Analysis Targets: source files
target1="../sources/main.c \
  ../avr-libc/libc/stdio/iob.c \
  ../sources/eeprom_stubs.c \
  ../sources/avr_stubs.c"

cmd1="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams \$n $target1
done"

(time timeout $timelimit bash -c "$cmd1") 1> $logfile 2>&1
