# Use the official Redis image
FROM redis:6.2

# Create a simple redis configuration file with appendonly mode enabled
RUN mkdir -p /usr/local/etc/redis && \
    echo "appendonly yes" > /usr/local/etc/redis/redis.conf && \
    echo "protected-mode yes" >> /usr/local/etc/redis/redis.conf && \
    echo "bind 0.0.0.0" >> /usr/local/etc/redis/redis.conf && \
    chown redis:redis /usr/local/etc/redis/redis.conf

# Create a simple entrypoint script to handle password configuration
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose Redis port
EXPOSE 6379

# Start Redis with our entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
