#!/bin/bash

# Укажите путь к вашей директории
folderPath="/path/to/your/directory"

# Пройдите по каждому файлу в директории
for file in "$folderPath"/*
do
    # Добавьте красный тег к каждому файлу
    xattr -w com.apple.metadata:_kMDItemUserTags '("Red\n6")' "$file"
done
