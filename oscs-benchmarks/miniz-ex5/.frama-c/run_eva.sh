#!/bin/sh

# Default values for parameters (can be overridden by command-line arguments)
default_timelimit="30m"
default_logfile="log_eva"
default_parameters=""

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --timelimit=*)
            timelimit="${1#*=}"
            ;;
        --logfile=*)
            logfile="${1#*=}"
            ;;
        --parameters=*)
            parameters="${1#*=}"
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
parameters="${parameters:-$default_parameters}"

# Preprocessing arguments for -cpp-extra-args
cppargs="-I.."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here




evaparams5="-eva -eva-precision 0 $parameters" 


# Analysis Targets: source files
target5="stubs.c \
  ../examples/example5.c \
  ../miniz.c \
  ../miniz_tdef.c \
  ../miniz_tinfl.c"





cmd5="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams5 $target5"






eval "(time timeout $timelimit $cmd5) 1> $logfile 2>&1"

