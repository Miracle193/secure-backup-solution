#!/bin/bash

#Configuration
SOURCE_DIR=""                   # Directory to back up
BACKUP_DIR=""                   # Directory to store the initial backup file  
ENCRYPTED_BACKUP=""             # Directoru to store the encrypted backup file
LOG_FILE=""                     # Log file to record backup operations
REMOTE="google_drive:backup"    # rclone remote configuration for Google Drive
KEY_FILE=""                     # File containing the encryption key

# Create a backup archive 
tar -czf ${BACKUP_DIR}/backup_$(date +%F).tar.gz -C ${SOURCE_DIR} .

# Encrypt the backup
openssl enc -aes-256-cbc -salt -in ${BACKUP_DIR}/backup_$(date +%F).tar.gz -out ${ENCRYPTED_BACKUP}/backup_$(date +%F).tar.gz.enc -pass file:${KEY_FILE}

# Transfer the encrypted backup to Google Drive
rclone copy ${ENCRYPTED_BACKUP}/backup_$(date +%F).tar.gz.enc ${REMOTE}

# Log the operation
echo "Backup and transfer completed on $(date)" >> ${LOG_FILE}

# Clean up local backup files older than 7 days
find ${BACKUP_DIR} -type f -mtime +7 -exec rm  {} \;
find ${ENCRYPTED_BACKUP} -type f -mtime +7 -exec rm {} \;