#!/bin/bash

bash backup-desktop.sh

# Path to rsync
RSYNC_PATH="/opt/homebrew/bin/rsync"  # Adjust for Intel Macs if needed

# Define source directory (external disk root)
SOURCE_DIR="/Volumes/2TB-WD"

# Define destination directory (external backup)
DESTINATION="/Volumes/backups-personal/External"

# Define the log file path
LOGFILE="$HOME/backup_external_disk_log.txt"

# Date and Time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start the backup process
echo "Starting external disk backup: $DATE" | tee -a "$LOGFILE"

echo "Syncing $SOURCE_DIR to $DESTINATION" | tee -a "$LOGFILE"

# Sync source directory to the destination with real-time display, no delete
$RSYNC_PATH -avh --info=progress2 "$SOURCE_DIR" "$DESTINATION" 2>&1 | tee -a "$LOGFILE"

if [ $? -eq 0 ]; then
    echo "Successfully synced: $SOURCE_DIR" | tee -a "$LOGFILE"
else
    echo "Error syncing: $SOURCE_DIR" | tee -a "$LOGFILE"
fi

echo "Backup completed: $DATE" | tee -a "$LOGFILE"
echo "------------------------------" | tee -a "$LOGFILE"
