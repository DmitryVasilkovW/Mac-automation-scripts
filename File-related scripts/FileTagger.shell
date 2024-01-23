#!/bin/bash

directoryPath="/t/m/p"

for file in "$directoryPath"/*; do

    filename=$(basename "$file")

    if [[ $filename == *'Запись'* || $filename == *'Снимок'* ]]; then
 
        tags=$(xattr -p com.apple.metadata:_kMDItemUserTags "$file" 2>/dev/null)
        
        if [[ -z $tags ]]; then
            xattr -w com.apple.metadata:_kMDItemUserTags '(\"Красный\\n6\")' "$file"
        fi
    fi
done
