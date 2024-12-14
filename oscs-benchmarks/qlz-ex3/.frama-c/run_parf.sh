#!/bin/sh

timelimit="65m"
# Default values for parameters (can be overridden by command-line arguments)
default_timeBudget=3600
default_processCore=4
default_sampleNum=4
default_refineNum=7
default_logFile="log_parf"

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --timeBudget=*)
            timeBudget="${1#*=}"
            ;;
        --processCore=*)
            processCore="${1#*=}"
            ;;
        --sampleNum=*)
            sampleNum="${1#*=}"
            ;;
        --refineNum=*)
            refineNum="${1#*=}"
            ;;
        --logFile=*)
            logFile="${1#*=}"
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Set defaults if not provided
timeBudget="${timeBudget:-$default_timeBudget}"
processCore="${processCore:-$default_processCore}"
sampleNum="${sampleNum:-$default_sampleNum}"
refineNum="${refineNum:-$default_refineNum}"
logFile="${logFile:-$default_logFile}"

# Preprocessing arguments for -cpp-extra-args


cppargs3="-DQLZ_COMPRESSION_LEVEL=3 -DQLZ_STREAMING_BUFFER=10000"


# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="-add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -kernel-warn-key typing:implicit-function-declaration=abort \
  -main eva_main"

# Specific parf parameters


parfparams3="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 


# Analysis Targets: source files
target3="../stream_compress.c \
  ../quicklz.c \
  fc_stubs.c"



cmd3="frama-c -cpp-extra-args=\"$cppargs3\" $kernelparams $parfparams3 $target3"






eval "(time timeout $timelimit $cmd3) 1> $logfile 2>&1"



