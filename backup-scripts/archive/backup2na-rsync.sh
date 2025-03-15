#!/bin/bash

# Define the source directories as a space-separated list
SOURCE_DIRS=(
    "/Volumes/2TB-WD/Downloads/"
#    "/Volumes/2TB-WD/My GitHub"
#    "/Volumes/2TB-WD/GetTemplates"
#    "/Volumes/2TB-WD/Applications"
#    "/Volumes/2TB-WD/My GitHub"
#    "/Volumes/2TB-WD/docker-backup"
#    "/Volumes/2TB-WD/Documents"
#    "/Volumes/2TB-WD/old-stuff"
#    "/Volumes/2TB-WD/Projects"
#    "/Volumes/2TB-WD/Viral Pack"
#    "/Volumes/2TB-WD/My GitHub"
)

# Define the destination directory
DESTINATION="/Volumes/backups-personal/External/Downloads/"

# Define the log file path
LOGFILE="$HOME/downloads_move_log.txt"

# Date and Time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start the process
echo "Starting move operation: $DATE" | tee -a "$LOGFILE"

# Loop through each source directory
for SOURCE in "${SOURCE_DIRS[@]}"; do
    echo "Processing source directory: $SOURCE" | tee -a "$LOGFILE"

    # Check if the source directory exists
    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source directory $SOURCE does not exist. Skipping." | tee -a "$LOGFILE"
        continue
    fi

    # Move files while preserving directory structure
    find "$SOURCE" -type f | while read -r FILE; do
        # Determine the relative path of the file
        RELATIVE_PATH="${FILE#$SOURCE/}"

        # Create the corresponding directory structure in the destination
        DEST_DIR="$DESTINATION/$(dirname "$RELATIVE_PATH")"
        mkdir -p "$DEST_DIR"

        # Move the file to the destination
        mv -v "$FILE" "$DEST_DIR/" 2>&1 | tee -a "$LOGFILE"
    done

    # Remove empty directories from the source
    find "$SOURCE" -type d -empty -delete
done

echo "Move operation completed: $DATE" | tee -a "$LOGFILE"
echo "------------------------------" | tee -a "$LOGFILE"