#!/bin/bash

LOG_FILE="/var/log/system_update.log"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')

log_message() {
    echo "$1" >> "$LOG_FILE"
}

log_message "System update started at $DATE."

sudo apt-get update >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "Failed to update package lists."
    exit 1
fi

sudo apt-get upgrade -y >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "Failed to upgrade packages."
    exit 1
fi

sudo apt-get autoremove -y >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "Failed to remove unused packages."
    exit 1
fi

sudo apt-get clean >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "Failed to clean old package files."
    exit 1
fi

services=("apache2" "mysql" "ssh")
for service in "${services[@]}"; do
    systemctl is-active --quiet "$service"
    if [ $? -eq 0 ]; then
        log_message "$service is running."
    else
        log_message "$service is not running. Attempting to restart..."
        sudo systemctl restart "$service"
        if [ $? -eq 0 ]; then
            log_message "$service restarted successfully."
        else
            log_message "Failed to restart $service."
        fi
    fi
done

log_message "System update and cleanup completed at $(date '+%Y-%m-%d_%H-%M-%S')."
echo "System update and cleanup completed. Check $LOG_FILE for details."
