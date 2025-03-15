#!/bin/bash

# First rsync task: Backup User Downloads
source_dir_downloads="/Users/laulau/Downloads/"
destination_dir_downloads="/Volumes/2TB-WD/Downloads/"

# Check if the source directory exists
if [ ! -d "$source_dir_downloads" ]; then
  echo "Error: Source directory '$source_dir_downloads' does not exist."
  exit 1
fi

# Run rsync for User Downloads
rsync -av "$source_dir_downloads" "$destination_dir_downloads"
echo "User Downloads directory synced to backup location using rsync."


# Second rsync task: Backup External Downloads
source_dir_external="/Users/laulau/Downloads/"
destination_dir_external="/Volumes/backups-personal/External/Downloads/"

# Check if the source directory exists
if [ ! -d "$source_dir_external" ]; then
  echo "Error: Source directory '$source_dir_external' does not exist."
  exit 1
fi

# Run rsync for External Downloads
rsync -av "$source_dir_external" "$destination_dir_external"
echo "External Downloads directory synced to backup location using rsync."

echo "Both Downloads directories synced to their respective backup locations."