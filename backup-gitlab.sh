#!/bin/bash
# Script to backup GitLab data

# Configuration
BACKUP_DIR="/path/to/gitlab/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILENAME="gitlab_backup_$DATE.tar"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create GitLab backup
echo "Creating GitLab backup..."
docker exec -t gitlab-web gitlab-backup create STRATEGY=copy

# Copy the backup from the container
echo "Copying backup from container..."
docker cp gitlab-web:/var/opt/gitlab/backups/ $BACKUP_DIR/

# Create a separate backup of GitLab configuration
echo "Backing up configuration files..."
docker cp gitlab-web:/etc/gitlab/ $BACKUP_DIR/gitlab-config-$DATE/

# Package everything into a single archive
tar -cf $BACKUP_DIR/$BACKUP_FILENAME -C $BACKUP_DIR backups gitlab-config-$DATE

# Cleanup temporary files
rm -rf $BACKUP_DIR/backups $BACKUP_DIR/gitlab-config-$DATE

echo "Backup completed: $BACKUP_DIR/$BACKUP_FILENAME"