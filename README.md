# Secure Backup Solution

## Summary
The Secure Backup Solution is a solution that involves several components to ensure that data is backed up securely and protected against unuathorized access, corruption, and loss.

## Requirements
1. Data to Backup: Dummy files stored in a folder
2. Frequency: Data is backed up weekly every Sunday at 00:00AM
3. Retention Policy: Backups are kept for at most 3 months (90 days).
4. Recovery Time Objective (RTO): Data is restored in 24 hours.
5. Recovery Point Objective (RPO): The maximum acceptable amount of data loss is 168 hours (one week).

## Backup Location
For this project, I backed up my data in Google Drive.

## Encryption
AES-256 CBC is used to encrypt the backup files.

## Automation
The [bash script](/backup_to_gdrive.sh/) and Crontab are used to automate the backup process.

## Setup
