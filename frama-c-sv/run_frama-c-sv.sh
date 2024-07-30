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
      
    if [ ! -f "$INPUTDIR"/"$filename" ]; then  
        echo "Warning: Filename "$INPUTDIR"/$filename does not exist. Skipping..."  
        continue  
    fi  
      
    name=$(basename "$filename" .yml)
    eval "(time timeout 15m ./frama-c-sv.py --program $INPUTDIR/$sourcefile --property $INPUTDIR/$filename) 1> $OUTPUTDIR/${name}.result 2>&1" 
      
    if [ $? -eq 124 ]; then  
        echo "Warning: Command timed out for $sourcefile $filename"  
    elif [ $? -ne 0 ]; then  
        echo "Error: Command failed for $sourcefile $filename"  
    fi  
done < "$TARGETFILE"  
  
echo "Processing complete."
