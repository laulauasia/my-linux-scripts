#!/bin/bash

source_dir="/Users/laulau/Downloads"
destination_dir="/Volumes/2TB-WD/Downloads"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Error: Source directory '$source_dir' does not exist."
  exit 1
fi

# Move files from source to destination
find "$source_dir" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
  mv -fv "$file" "$destination_dir"
done

echo "Files moved successfully from '$source_dir' to '$destination_dir'."