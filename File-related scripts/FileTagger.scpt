script FileTagger
	property directoryPath : missing value
	
	on initWithPath(path)
		set directoryPath to path
	end initWithPath
	
	on tag()
		do shell script "
    for file in " & quoted form of directoryPath & "/*; do
 
        filename=$(basename \"$file\")
     
        if [[ $filename == *'Запись'* || $filename == *'Снимок'* ]]; then
         
            tags=$(xattr -p com.apple.metadata:_kMDItemUserTags \"$file\" 2>/dev/null)
     
            if [[ -z $tags ]]; then
                xattr -w com.apple.metadata:_kMDItemUserTags '(\"Красный\\n6\")' \"$file\"
            fi
        fi
    done
    "
	end tag
	
	
	
	
	on tagFilesWithNewPath(path)
		my initWithPath(path)
		
		my tag()
	end tagFilesWithNewPath
	
	on tagFilesWithOldPath()
		
		if directoryPath is missing value then
			display dialog "Error: folder path is not set."
			error number -128
		end if
		
		my tag()
	end tagFilesWithOldPath
	
end script
