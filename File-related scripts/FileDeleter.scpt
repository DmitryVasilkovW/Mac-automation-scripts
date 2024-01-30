script FileDeleter
	property directoryPath : missing value
	
	on initWithPath(path)
		set directoryPath to path
	end initWithPath
	
	on deleteFiles()
		set fileList to list folder directoryPath without invisibles
		

		repeat with fileName in fileList
			set filePath to directoryPath & "/" & fileName
			
			set fileTags to paragraphs of (do shell script "mdls -name kMDItemFSLabel -raw " & quoted form of filePath)
			
			if item 1 of fileTags is "1" then
				do shell script "rm " & quoted form of filePath
				display dialog "Файл " & fileName & " удален"
			end if
		end repeat
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
