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
cppargs="-std=c99 \
  -I.. \
  -D__gmp_asprintf=asprintf"

# General kernel parameters
## Please add kernel parameters here if necessary 
kernelparams="\
  -add-symbolic-path=..:. \
  -kernel-warn-key annot:missing-spec=abort \
  -main testmain"

# Specific parf parameters
parfparams="-parf -parf-budget $timeBudget -parf-process $processCore -parf-sample-num $sampleNum -parf-refine-num $refineNum" 

# Analysis Targets: source files
target1="$(frama-c-config -print-share-path)/libc/stdio.c \
  ../tests/testutils.c \
  ../tests/t-add.c \
  ../tests/hex-random.c \
  ../tests/mini-random.c \
  fc_stubs.h"

cmd1="frama-c -cpp-extra-args=\"$cppargs\" $kernelparams $parfparams $target1"

eval "(time timeout $timelimit $cmd1) 1> $logFile 2>&1"
#rm -rf parf_temp_files
