#!/bin/bash

(crontab -l 2>/dev/null; echo "0 2 * * * /home/user/scripts/backup.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 3 * * * /home/user/scripts/system_update.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 12 * * * /home/user/scripts/disk_usage.sh") | crontab -

echo "Cron jobs scheduled for backup, system update, and disk usage check."
