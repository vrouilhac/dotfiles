#!/bin/bash

FOLDERNAME=$(date | awk '{ print $4 }' | awk -F ':' '{ print $1 }')
DIRECTORY="${HOME}/.backups/obsidian/${FOLDERNAME}"
NOTIFICATION_ERROR="display notification \"An error occured during Obsidian backup (${FOLDERNAME})\" with title \"Obsidian Backup Error\""
LOG_FILE="/tmp/backup_obsidian_out.log"

echo "Obsidian Backup (${FOLDERNAME})" > "$LOG_FILE"

[ -d "${DIRECTORY}" ] && (rm -r "${DIRECTORY}" || osascript -e "${NOTIFICATION_ERROR}")

mkdir "${DIRECTORY}" || osascript -e "${NOTIFICATION_ERROR}" 

cp -R /Users/vincentrouilhac/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/notes "${DIRECTORY}" || osascript -e "${NOTIFICATION_ERROR}"

echo "Backup saved!" >> "$LOG_FILE"
