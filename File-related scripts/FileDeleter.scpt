script FileDeleter
	property directoryPath : missing value
	
	on initWithPath(path)
		set directoryPath to POSIX file path as alias
	end initWithPath
	
	on deleteFiles()
		tell application "Finder"
			set filesInDirectory to every file in folder directoryPath
			repeat with i from 1 to number of items in filesInDirectory

				set this_item to item i of filesInDirectory
				set filePath to quoted form of (POSIX path of (this_item as alias))
				set fileTags to do shell script "xattr -p com.apple.metadata:_kMDItemUserTags " & filePath

				if fileTags contains "Красный\\n6" then
					delete this_item
				end if
			end repeat
		end tell
	end deleteFiles
	
	deleteFiles()
	
	
	on deleteFilesWithNewPath(path)
		my initWithPath(path)
		
		my deleteFiles()
	end deleteFilesWithNewPath
	
	on tagFilesWithOldPath()
		
		if directoryPath is missing value then
			display dialog "Error: folder path is not set."
			error number -128
		end if
		
		my tag()
	end tagFilesWithOldPath
	
end script
