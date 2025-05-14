#!/bin/bash
# Setup script for GitLab Docker deployment

# Create necessary directories
mkdir -p /srv/gitlab/config
mkdir -p /srv/gitlab/logs
mkdir -p /srv/gitlab/data
mkdir -p /srv/gitlab/postgres

# Set proper permissions
chmod 777 -R /srv/gitlab

# Load environment variables
source .env

# Start the containers
docker-compose up -d

echo "GitLab is starting up. This may take a few minutes..."
echo "You can check startup progress with: docker logs -f gitlab-web"
echo ""
echo "Once started, access GitLab at http://localhost"
echo "Default username: root"
echo "Default password: $GITLAB_ROOT_PASSWORD (from .env file)"
echo ""
echo "Note: On first login, you'll be prompted to change the root password"