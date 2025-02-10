#!/bin/bash

DISK_THRESHOLD=90
LOG_FILE="/var/log/disk_usage.log"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')

log_message() {
    echo "$1" >> "$LOG_FILE"
}

log_message "Checking disk usage at $DATE."
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_message "Warning: Disk usage is above $DISK_THRESHOLD%. Current usage: $DISK_USAGE%."
    sudo rm -rf /tmp/*
    log_message "Cleaning up temporary files..."
    find /var/log -type f -name "*.log" -exec rm -f {} \;
    log_message "Removing old log files..."
    log_message "Disk usage cleanup completed."
else
    log_message "Disk usage is under control. Current usage: $DISK_USAGE%."
fi

echo "Disk usage check and cleanup completed. Check $LOG_FILE for details."
