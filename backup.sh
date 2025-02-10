#!/bin/bash

SOURCE_DIR="/home/user/data"
BACKUP_DIR="/home/user/backups"
LOG_FILE="/home/user/backup_log.txt"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')

log_message() {
    echo "$1" >> "$LOG_FILE"
}

if [ ! -d "$BACKUP_DIR" ]; then
    log_message "Backup directory does not exist, creating directory..."
    mkdir -p "$BACKUP_DIR"
fi

BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

log_message "Starting backup from $SOURCE_DIR to $BACKUP_FILE"
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
if [ $? -eq 0 ]; then
    log_message "Backup successfully created at $BACKUP_FILE"
else
    log_message "Backup failed"
    exit 1
fi

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;
log_message "Old backup files older than 7 days deleted."

echo "Backup completed and old files deleted. Check the log for details."
