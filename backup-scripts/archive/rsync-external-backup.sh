#!/bin/bash

# Path to updated rsync
RSYNC_PATH="/opt/homebrew/bin/rsync"  # Adjust for Intel Macs: /usr/local/bin/rsync

# Define your source directories
SOURCE_DIRS=(
    "/Users/laulau/Desktop"
)

# Define the destination directory
DESTINATION="/Volumes/2TB-WD/My Desktop"

# Define the log file path
LOGFILE="$HOME/backup_log.txt"

# Date and Time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start the backup process
echo "Starting backup: $DATE" | tee -a "$LOGFILE"

for SOURCE in "${SOURCE_DIRS[@]}"; do
    echo "Syncing $SOURCE to $DESTINATION" | tee -a "$LOGFILE"
    
    # Sync each source directory to the destination with real-time display
    $RSYNC_PATH -avh --delete --info=progress2 "$SOURCE" "$DESTINATION" 2>&1 | tee -a "$LOGFILE"
    
    if [ $? -eq 0 ]; then
        echo "Successfully synced: $SOURCE" | tee -a "$LOGFILE"
    else
        echo "Error syncing: $SOURCE" | tee -a "$LOGFILE"
    fi
done

echo "Backup completed: $DATE" | tee -a "$LOGFILE"
echo "------------------------------" | tee -a "$LOGFILE"