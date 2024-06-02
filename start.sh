#!/bin/bash

echo "Files to run:"

# get all js files
files=($(find . -path ./node_modules -prune -o -type f -name "*.js" -print))

if [ ${#files[@]} -eq 0 ]; then
    # no files found
    echo "No files found."
    exit 1
fi

for i in "${!files[@]}"; do
    echo "$((i+1)). ${files[$i]}"
done

# Prompt the user to select a file
read -p "Enter the number of the file you want to run: " file_number

# Check if the input is a valid number and within the range
if [[ $file_number =~ ^[0-9]+$ ]] && [ $file_number -ge 1 ] && [ $file_number -le ${#files[@]} ]; then
  selected_file=${files[$((file_number-1))]}
  echo "Running $selected_file..."
  node "$selected_file"
else
  echo "Invalid selection. Exiting."
  exit 1
fi