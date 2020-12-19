#!/bin/bash

if [ $# -ne 1 ]; then
    echo "[USAGE]: $0 <daily|weekly|monthly>"
    exit 1
fi

# Export aditional scripts (like notify)
SCRIPTS_DIR="/home/perseo/scripts/"
export PATH=$PATH:$SCRIPTS_DIR

TODAY=`date -I`
BACKUP_PATH="/home/perseo/hdd/Backup/auto-backups/"
BACKUP_DAILY=$BACKUP_PATH/'daily/'   # Trailing slash is important to not create a daily folder inside weekly folder
BACKUP_WEEKLY=$BACKUP_PATH/'weekly/'
BACKUP_MONTHLY=$BACKUP_PATH/'monthly/'

LOG_PATH="/home/perseo/hdd/Backup/auto-backups/logs/$TODAY"
#EXCLUDES="/dev/*,/proc/*,/sys/*,/tmp/*,/usr/tmp/*,/run/*,/mnt/*,/media/*,/var/cache/*,/var/tmp,/boot/lost+found/*,/lost+found,/home/perseo/hdd/*"

if [ "$1" == "daily" ]; then
    echo "Starting daily backup..."
    notify "Starting daily backup..."
    # This create empty excluded directories: rsync --info=progress2 -aAXv --delete --delete-excluded --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/usr/tmp/*,/run/*,/mnt/*,/media/*,/var/cache/*,/lost+found,/home/perseo/hdd/*} / $BACKUP_DAILY --log-file="${LOG_PATH}.daily"
    rsync -avz --exclude="/tmp" --exclude="/sys" --exclude="/lost+found" --exclude="/mnt" --exclude="/proc" --exclude="/dev" --exclude="/media" --exclude="/run" --exclude="/usr/tmp" --exclude="/var" --exclude="/home/perseo/hdd" / $BACKUP_DAILY --log-file="/${LOG_PATH}.daily"
    notify "Daily backup have finish"

elif [ "$1" == "weekly" ]; then
    echo "Starting weekly backup..."
    notify "Starting weekly backup..."
    rsync -aAXv --delete $BACKUP_DAILY $BACKUP_WEEKLY --log-file="${LOG_PATH}.weekly"
    notify "Weekly backup have finish"

elif [ "$1" == "monthly" ]; then
    echo "Starting monthly backup..."
    notify "Starting monthly backup..."
    tar -cvjf $BACKUP_MONTHLY/$(date -I).tar.bz2 $BACKUP_DAILY
    notify "Monthly backup have finish"
fi
