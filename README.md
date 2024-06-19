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
### 1. Install rclone, a command-line program to manage files in cloud storage on Linux/macOS/BSD system:
```bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```
See [here](rclone.org/install/) for installation guidelines according to your system.

### 2. Run the following command to config rclone:
```bash
rclone config
```
For the prompts to configure to a new remote for Google Drive:

a. Enter 'n' for New remote

b. Enter 'google_drive' for name for new remote

c. Enter 'drive' for Type of storage to configure

d. Press enter (or blank) for Client ID

e. Press enter (or blank) for Secret

f. Enter '1' for Scope

g. Press enter (or blank) for Service Account Credentials

h. Enter 'n' for Edit advanced config?

i. Enter 'y' for Use web browser to automatically authenticate rclone with remote?

j. Enter 'n' for Configure this as a Shared Drive (Team Drive)?

k. Enter 'y' for Keep this "google_drive" remote?

### 3. Copy the [bash script](/backup_to_gdrive.sh/) and adjust the directory of source and backup folder of the files you want to backup accordingly.

### 4. Save the script and make the script executable:
```bash 
chmod +x /path/to/backup_to_gdrive.sh
```

### 5. Automate the script
For Unix or macOS systems:
```bash
crontab -e
```

Add the line to schedule the script to run every Sunday of the week at 12AM
```bash
0 0 * * 0 /path/to/backup_to_gdrive.sh
```

Cron Job Syntax
```lua
* * * * * /path/to/command
| | | | |
| | | | +---- Day of the week (0 - 7) (Sunday=0 or 7)
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```


### Note: Depending on how your permissions are set up in your macOS system, cron may be unable to run the script. If this occurs, you would need to provide Full Disk access to cron. Navigate to the site here on more details on how to provide Full Disk access to cron on macOS: https://osxdaily.com/2020/04/27/fix-cron-permissions-macos-full-disk-access/
