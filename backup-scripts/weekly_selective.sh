#!/bin/bash

# Path to rsync
RSYNC_PATH="/opt/homebrew/bin/rsync"  # Adjust for Intel Macs if needed

# Define source directories - uncomment the ones you want to backup
SOURCE_DIRS=(
    # "/Volumes/2TB-WD/AI Models"
    # "/Volumes/2TB-WD/Applications"
    # "/Volumes/2TB-WD/backup"
    # "/Volumes/2TB-WD/docker-backup"
     "/Volumes/2TB-WD/Documents"
    # "/Volumes/2TB-WD/Downloads"
     "/Volumes/2TB-WD/GetTemplates"
     "/Volumes/2TB-WD/My Desktop"
    # "/Volumes/2TB-WD/My GitHub"
    # "/Volumes/2TB-WD/My Music"
     "/Volumes/2TB-WD/old-stuff"
     "/Volumes/2TB-WD/Photos"
     "/Volumes/2TB-WD/Projects"
     "/Volumes/2TB-WD/Viral Pack"
)

# Define the destination directory
DESTINATION="/Volumes/backups-personal/External"

# Define the log file path
LOGFILE="$HOME/backup_selective_log.txt"

# Date and Time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start the backup process
echo "Starting selective backup: $DATE" | tee -a "$LOGFILE"

if [ ${#SOURCE_DIRS[@]} -eq 0 ]; then
    echo "Warning: No source directories selected in SOURCE_DIRS array." | tee -a "$LOGFILE"
    echo "Please uncomment the directories you wish to backup in the script." | tee -a "$LOGFILE"
    exit 1
fi

for SOURCE in "${SOURCE_DIRS[@]}"; do
    if [ -d "$SOURCE" ]; then
        echo "Syncing $SOURCE to $DESTINATION" | tee -a "$LOGFILE"

        # Sync each source directory to the destination with real-time display
        $RSYNC_PATH -avh --info=progress2 "$SOURCE" "$DESTINATION" 2>&1 | tee -a "$LOGFILE"

        if [ $? -eq 0 ]; then
            echo "Successfully synced: $SOURCE" | tee -a "$LOGFILE"
        else
            echo "Error syncing: $SOURCE" | tee -a "$LOGFILE"
        fi
    else
        echo "Error: Source directory '$SOURCE' does not exist or is not a directory." | tee -a "$LOGFILE"
    fi
done

echo "Selective backup completed: $DATE" | tee -a "$LOGFILE"
echo "------------------------------" | tee -a "$LOGFILE"
