#!/bin/sh

default_directory="../oscs-benchmarks"
default_logfile="log_eva_precision0"

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --directory=*)
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
directory="${directory:-$default_directory}"
logfile="${logfile:-$default_logfile}"

for dir in "$directory"/*; do
    #echo "$dir"
    if [ -d "$dir" ]; then
        echo "$dir"
        cd "$dir"/.frama-c
        echo "runing $dir/.frama-c/run_eva_precision0.sh"
        ./run_eva_precision0.sh --timelimit=10m --logfile="$logfile"
        cd -
    fi
done
