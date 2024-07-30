#!/bin/sh  
  
# 检查参数数量  
if [ "$#" -ne 3 ]; then  
    echo "Usage: $0 inputdir targetfile outputdir"  
    exit 1  
fi  

INPUTDIR="$1"
TARGETFILE="$2"  
OUTPUTDIR="$3"
  
if [ ! -f "$TARGETFILE" ]; then  
    echo "Error: $TARGETFILE does not exist."  
    exit 1  
fi  

if [ ! -d "$INPUTDIR" ]; then  
    echo "Error: $INPUTDIR does not exist."  
    exit 1  
fi  

if [ ! -d "$OUTPUTDIR" ]; then  
    mkdir "$OUTPUTDIR"
fi  
  
while IFS= read -r line; do  
    sourcefile=$(echo "$line" | awk '{print $1}')
    filename=$(echo "$line" | awk '{print $2}')

    if [ ! -f "$INPUTDIR"/"$sourcefile" ]; then  
        echo "Warning: Source file "$INPUTDIR"/$sourcefile does not exist. Skipping..."  
        continue  
    fi  

    name=$(basename "$filename" .yml)
    timeout 7.5m dune exec -- frama-c harness.c "$INPUTDIR"/"$sourcefile" -parf -parf-budget 420 > output_tmp
    
    sed -n '/\[parf\] Final parameter: /{s/.*\[parf\] Final parameter: //;p;}' output_tmp > "$OUTPUTDIR"/"$name"

    rm -f output_tmp
    rm -rf output/
done < "$TARGETFILE"  
  
echo "Processing complete."
