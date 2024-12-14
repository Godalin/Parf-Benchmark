#!/bin/sh

# Default values for parameters (can be overridden by command-line arguments)
default_timelimit="10m"
default_logfile="log_eva_default"

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --timelimit=*)
            timelimit="${1#*=}"
            ;;
        --logfile=*)
            logfile="${1#*=}"
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Set defaults if not provided
timelimit="${timelimit:-$default_timelimit}"
logfile="${logfile:-$default_logfile}"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I../src \
  -I../src/optional"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here
evaparams="-eva" 

# Analysis Targets: source files
target1="../src/monocypher.c \
  ../src/optional/sha512.c \
  ../tests/test.c"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logfile 2>&1"
