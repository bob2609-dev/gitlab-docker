
#!/bin/bash
set -e

# Set Docker configuration to use our custom config without credential helper
export DOCKER_CONFIG=$(pwd)
cp .dockerconfig config.json

echo "Building GitLab Docker images..."
docker-compose build

# Clean up
rm config.json

echo "\nBuild completed! You can now start the services with: docker-compose up -d"
