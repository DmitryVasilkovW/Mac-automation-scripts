on adding folder items to this_folder after receiving added_items
	repeat with anItem in added_items
		set itemPath to POSIX path of anItem
		set itemExtension to (do shell script "echo " & quoted form of itemPath & " | awk -F. '{print tolower($NF)}'")
		
		if itemExtension is in {"png", "jpg", "jpeg", "heic", "gif"} then
			do shell script "osascript -e 'set the clipboard to (read (POSIX file \"" & itemPath & "\") as «class PNGf»)'"
			exit repeat
		end if
	end repeat
end adding folder items to
