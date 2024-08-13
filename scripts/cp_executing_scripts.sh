#!/bin/sh

directory="../oscs-benchmarks"
sourcefile="run_mopsa_default.sh"
targetfile="run_mopsa_least.sh"

for dir in "$directory"/*; do
    #echo "$dir"
    if [ -d "$dir" ]; then
        echo "$dir"
        cd "$dir"/.frama-c
        echo $sourcefile $targetfile
        #eval "(time timeout $timelimit ./run_parf.sh) >& log"

        # this file should do what its name says!!!

        cp $sourcefile $targetfile
        # rm $targetfile
        cd -
    fi
done
