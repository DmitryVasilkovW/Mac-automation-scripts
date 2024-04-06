script FileTagReader
  property directoryPath : missing value

  on initWithPath(path)
    set directoryPath to path
  end initWithPath

  on readTags()
    tell application "Finder"
      set directoryPath to POSIX file directoryPath as alias
      set filesInDirectory to every file in folder directoryPath

      repeat with i from 1 to number of items in filesInDirectory
        set this_item to item i of filesInDirectory
        set filePath to quoted form of (POSIX path of (this_item as alias))
        set fileTags to do shell script "mdls -raw -name kMDItemUserTags " & filePath

        display dialog "Файл " & name of this_item & " имеет следующие теги: " & fileTags & "."
      end repeat
    end tell
end readTags


  on readTagsWithNewPath(path)
    my initWithPath(path)
    my readTags()
  end readTagsWithNewPath

end script

set tagReader to FileTagReader
tell tagReader to readTagsWithNewPath("/Users/dmitryvasilkov/Desktop/bimbim")
