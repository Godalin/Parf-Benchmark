#!/bin/sh

directory="$(dirname "$0")/../oscs-benchmarks"
targetfile="run_mopsa_least.sh"

echo $directory

for dir in "$directory"/*; do
    echo "$dir"
    if [ -d $dir ]; then
        echo "$dir"
        cd "$dir"/.frama-c

        # this file should do what its name says!!!
        rm $targetfile
        cd -
    fi
done
cd -
