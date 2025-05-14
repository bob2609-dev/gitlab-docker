#!/bin/bash
set -e

# Add Redis password from environment variable if provided
if [ -n "$REDIS_PASSWORD" ]; then
  echo "Setting Redis password..."
  echo "requirepass $REDIS_PASSWORD" >> /usr/local/etc/redis/redis.conf
  echo "masterauth $REDIS_PASSWORD" >> /usr/local/etc/redis/redis.conf
fi

# First argument is 'redis-server' or starts with '-'
exec "$@"
