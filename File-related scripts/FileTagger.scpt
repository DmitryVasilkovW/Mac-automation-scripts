script FileTagger
	property directoryPath : missing value
	
	on initWithPath(path)
		set directoryPath to path
	end initWithPath
	
	on tag()
		do shell script "
        for file in " & quoted form of directoryPath & "/*; do
            xattr -w com.apple.metadata:_kMDItemUserTags '(\"Красный\\n6\")' \"$file\"

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
