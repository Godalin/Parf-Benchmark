#!/bin/bash

timelimit="20m"
logfile="log_mopsa_default"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I ../avr-libc/include -I ../avr-libc/"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key linker:drop-conflicting-unused=inactive \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -absolute-valid-range 0x0020-0x08ff"

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../sources/main.c \
  ../avr-libc/libc/stdio/iob.c \
  ../sources/eeprom_stubs.c \
  ../sources/avr_stubs.c"

cmd1="mopsa-c $cppargs $mopsaparams $target1"

$cmd1 1> $logfile 2>&1
