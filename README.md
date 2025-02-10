Sure! Here's a `README.md` file for the bash scripts you provided:


# System Maintenance Scripts

This repository contains a collection of bash scripts designed for system maintenance tasks such as backup, system updates, disk usage monitoring, and regular task scheduling.

## Overview

The scripts included in this repository are:

1. **Backup System with Logging**
2. **Automated System Update and Cleanup**
3. **Disk Usage and Cleanup**
4. **Cron Job Scheduling for Regular Tasks**

Each script is designed to automate essential system tasks, with logging and error handling to ensure smooth operation.

---

## 1. Backup System with Logging

This script backs up a source directory to a backup directory and logs the results. It also deletes backup files older than 7 days to manage disk space.

### How to Use:

1. Modify the `SOURCE_DIR` and `BACKUP_DIR` variables to point to the source and destination directories.
2. Set up the `LOG_FILE` to where the log file should be stored.
3. Run the script to create a backup and remove old backups.

```bash
./backup.sh
```

### Logs:
- Logs will be stored in the `LOG_FILE` specified in the script.
- Successful and failed backup attempts are logged, along with information about old backups being deleted.

---

## 2. Automated System Update and Cleanup

This script automates the process of updating system packages, upgrading software, and cleaning up unused packages and old package files.

### How to Use:

1. Run the script as root to ensure it has the necessary permissions for updating the system.

```bash
sudo ./system_update.sh
```

### Logs:
- The script logs every step of the update and cleanup process, including any failures.

---

## 3. Disk Usage and Cleanup

This script checks disk usage and, if the usage exceeds a defined threshold, it cleans up temporary files and old log files.

### How to Use:

1. Modify the `DISK_THRESHOLD` to the desired disk usage percentage threshold (default: 90%).
2. Run the script to check disk usage and clean up files if necessary.

```bash
./disk_usage.sh
```

### Logs:
- Logs the current disk usage and any cleanup actions taken.

---

## 4. Cron Job Scheduling for Regular Tasks

This script schedules cron jobs to run the backup, system update, and disk usage scripts at regular intervals.

### How to Use:

1. Modify the cron schedules (located in the script) to fit your desired schedule.
2. Run the script to schedule the cron jobs.

```bash
./automation.sh
```

### Cron Jobs:
- **Backup**: Runs every day at 2:00 AM.
- **System Update**: Runs every day at 3:00 AM.
- **Disk Usage Check**: Runs every day at 12:00 PM.

---

## Requirements

- The scripts assume you are using a Linux-based system (Ubuntu/Debian).
- The user should have `sudo` privileges to run the update and cleanup tasks.
- The `tar`, `apt-get`, `systemctl`, and `df` commands should be available on the system.

---

