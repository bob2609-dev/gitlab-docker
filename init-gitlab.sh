#!/bin/bash
set -e

# Create necessary directories
mkdir -p ./data/gitlab/{config,logs,data}
mkdir -p ./data/postgres
echo "Created necessary directories"

# Set proper permissions
echo "Setting permissions..."
sudo chown -R 998:998 ./data/gitlab/data
sudo chown -R 999:999 ./data/postgres

echo "Initialization complete. You can now start GitLab with: docker-compose up -d"
