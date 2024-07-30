#!/bin/sh

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams=""

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva" 

# Analysis Targets: source files
target1="../2018_06_parser/parser_full.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval $cmd1
