#!/bin/bash

# Temporarily disable credential helper for Docker
export DOCKER_CONFIG=$(mktemp -d)
echo '{"credsStore":"","auths":{}}' > $DOCKER_CONFIG/config.json

# Pull the required images
docker pull gitlab/gitlab-ce:15.11
docker pull postgres:13-alpine
docker pull redis:6.2

# Clean up
rm -rf $DOCKER_CONFIG

echo "Images pulled successfully. You can now run: docker-compose up -d"
