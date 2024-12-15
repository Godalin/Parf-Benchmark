#!/bin/sh

# Default values for parameters (can be overridden by command-line arguments)
default_timelimit="10m"
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

cppargs2=""



# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific eva parameters
## Please add high-precision eva parameters here

evaparams2="-eva $parameters" 



# Analysis Targets: source files
target2="../decompress_file.c \
  ../quicklz.c \
  fc_stubs.c"


cmd2="frama-c -cpp-extra-args=\"$cppargs2\" $kernelparams $evaparams2 $target2"




eval "(time timeout $timelimit $cmd2) 1> $logfile 2>&1"


