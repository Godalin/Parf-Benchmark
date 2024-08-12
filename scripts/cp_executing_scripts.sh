#!/bin/sh

directory="../oscs-benchmarks"
sourcefile="run_eva_default.sh"
targetfile="run_mopsa_fast.sh"

for dir in "$directory"/*; do
    #echo "$dir"
    if [ -d "$dir" ]; then
        echo "$dir"
        cd "$dir"/.frama-c
        echo $sourcefile $targetfile
        #eval "(time timeout $timelimit ./run_parf.sh) >& log"
        # cp $sourcefile $targetfile
        rm $targetfile
        cd -
    fi
done
