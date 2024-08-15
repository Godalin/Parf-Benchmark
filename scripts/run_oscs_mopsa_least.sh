#!/bin/sh

directory="$(dirname "$0")/../oscs-benchmarks"
#timelimit="10m" 

for dir in "$directory"/*; do
    #echo "$dir"
    if [ -d "$dir" ]; then
        echo "$dir"
        cd "$dir"/.frama-c
        echo "runing $dir/.frama-c/run_mopsa_least.sh"
        ./run_mopsa_least.sh
        cd -
    fi
done
