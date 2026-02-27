# rclone-drive

Automated backup script that syncs a local folder to both Git and Google Drive.

## What It Does

1. **Navigates** to the local folder (`/home/hacker/second-brain`)
2. **Git Backup**: Detects changes in the folder, commits them, and pushes to the remote repository
3. **Google Drive Sync**: Uses rclone to sync the folder contents to Google Drive

## Usage

```bash
chmod +x brain.sh
./brain.sh
```

## Requirements

- Git
- rclone

### Install rclone

```bash
# Debian/Ubuntu
sudo apt install rclone

# Arch Linux
sudo pacman -S rclone

# Fedora
sudo dnf install rclone
```

Then configure rclone with Google Drive:

```bash
rclone config
```

## Automation

You can set up a cron job to run this script automatically:

```bash
crontab -e
```

Add the following line to run daily at 2 AM:

```
0 2 * * * /path/to/brain.sh >> /var/log/backup.log 2>&1
```
