#!/bin/sh  
  
if [ "$#" -ne 3 ]; then  
    echo "Usage: $0 sourcedir targetfile outputfile"  
    exit 1  
fi  
  
SOURCEDIR="$1"
TARGETFILE="$2"  
OUTPUTFILE="$3"  
  
# make sure the outputfile is empty
> "$OUTPUTFILE"  
  
while IFS= read -r filename; do  
    if [ -f "$SOURCEDIR"/"$filename" ]; then  
        # 查找'sourcefile'字符串  
        sourcefile=$(sed -n "s/.*input_files: '\([^']*\)'.*/\1/p" "$SOURCEDIR"/"$filename")  
        if [ -f "$SOURCEDIR"/"$sourcefile" ]; then  
            # 输出到outputfile  
            echo "$sourcefile $filename" >> "$OUTPUTFILE"  
        else  
            echo "Warning: No '$sourcefile' found in '$SOURCEDIR'"  
        fi  
    else  
        echo "Warning: File "$SOURCEDIR"/$filename does not exist"  
    fi  
done < "$TARGETFILE"  
  
echo "Processing complete. Output written to $OUTPUTFILE"
