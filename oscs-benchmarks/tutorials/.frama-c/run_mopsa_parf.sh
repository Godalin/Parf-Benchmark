#!/bin/bash

timelimit="20m"
logfile="log_mopsa_parf.log"

# Preprocessing arguments for -cpp-extra-args
cppargs=""

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams=""

# Specific eva parameters
## Please add high-precision eva parameters here
mopsaparams="" 

# Analysis Targets: source files
target1="../2018_06_parser/parser_full.c"

cmd1=parfext" $cppargs $mopsaparams $target1"

parfext "$cppargs $mopsaparams $target1" > $logfile
