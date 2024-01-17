tell application "Finder"
	set directoryPath to "Macintosh HD:Users:dmitryvasilkov:Desktop:бимбим:"
	set filesInDirectory to every file in folder directoryPath
	
	repeat with i from 1 to number of items in filesInDirectory
		set this_item to item i of filesInDirectory
		set filePath to quoted form of (POSIX path of (this_item as alias))
		set fileName to name of this_item
		set fileLabel to label index of this_item
		
		if (fileName contains "снимок" or fileName contains "Запись") and fileLabel is 0 then
			set label index of this_item to 2
		end if
	end repeat
end tell
