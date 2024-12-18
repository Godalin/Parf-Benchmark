#!/bin/sh

default_directory="../oscs-benchmarks"
default_timeBudget=3600
default_processCore=4
default_sampleNum=4
default_refineNum=7
default_logFile="log_parf"
default_output=".parf_temp_files"

# Parse command-line arguments
while [ $# -gt 0 ]; do
    case "$1" in
        --directory=*)
            timelimit="${1#*=}"
            ;;
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
        --output=*)
            output="${1#*=}"
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
timeBudget="${timeBudget:-$default_timeBudget}"
processCore="${processCore:-$default_processCore}"
sampleNum="${sampleNum:-$default_sampleNum}"
refineNum="${refineNum:-$default_refineNum}"
logFile="${logFile:-$default_logFile}"
output="${output:-$default_output}"

# for dir in "$directory"/*; do
#     #echo "$dir"
#     if [ -d "$dir" ]; then
#         echo "$dir"
#         cd "$dir"/.frama-c
#         echo "runing $dir/.frama-c/run_parf.sh"
#         ./run_parf.sh --timeBudget="$timeBudget" --processCore="$processCore" --sampleNum="$sampleNum" --refineNum="$refineNum" --logFile="$logFile" --output="$output"
#         cd -
#     fi
# done


# List of specific projects to process
selected_projects="miniz-ex2 miniz-ex3 miniz-ex4 miniz-ex5 miniz-ex6 qlz-ex2 qlz-ex3 qlz-ex4"

# Loop over selected projects
for project in $selected_projects; do
    project_dir="$directory/$project"
    if [ -d "$project_dir" ]; then
        echo "Processing $project_dir"
        cd "$project_dir/.frama-c" || { echo "Directory not found: $project_dir/.frama-c"; continue; }
        echo "Running $project_dir/.frama-c/run_parf.sh"
        ./run_parf.sh --timeBudget="$timeBudget" --processCore="$processCore" --sampleNum="$sampleNum" --refineNum="$refineNum" --logFile="$logFile" --output="$output"
        cd - >/dev/null
    else
        echo "Warning: Project directory not found: $project_dir"
    fi
done
