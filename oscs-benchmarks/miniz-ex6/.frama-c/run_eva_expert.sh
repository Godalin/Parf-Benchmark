#!/bin/sh

# Default values for parameters (can be overridden by command-line arguments)
default_timelimit="60m"
default_logfile="log_eva_expert"

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
cppargs="-I.."

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-main eva_main \
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort"

# Specific eva parameters
## Please add high-precision eva parameters here





evaparams6="-eva -eva-precision" 

# Analysis Targets: source files
target6="stubs.c \
  ../examples/example6.c \
  ../miniz.c \
  ../miniz_tdef.c"


cmd6="for n in {0..11}; do
    frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $evaparams6 \$n $target6
done"






(time timeout $timelimit bash -c "$cmd6") 1> $logfile 2>&1
