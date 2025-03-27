#!/bin/bash

# Define variables
SOURCE_DIR="/path/to/source" 
DEST_USER="remote_user"      
DEST_HOST="remote_host"      
DEST_DIR="/path/to/destination" 
LOG_FILE="backup.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP] Starting backup..." | tee -a "$LOG_FILE"
rsync -avz --delete "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR" 2>>"$LOG_FILE"
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Backup completed successfully." | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] ERROR: Backup failed!" | tee -a "$LOG_FILE"
fi



Modify the variables:
/path/to/source
replace remote_user and remote_host
/path/to/destination
chmod +x backup_script.sh
./backup_script.sh
