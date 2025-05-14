# Use the official PostgreSQL image with a more recent version
FROM postgres:16-alpine

# Create necessary directories and set permissions
RUN mkdir -p /var/lib/postgresql/data/pgdata && \
    chown -R postgres:postgres /var/lib/postgresql/data

# Set initialization arguments for database creation
ENV POSTGRES_INITDB_ARGS='--data-checksums' \
    PGDATA=/var/lib/postgresql/data/pgdata

# Add healthcheck for container monitoring
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD pg_isready -U postgres

# Expose PostgreSQL port
EXPOSE 5432

# Start PostgreSQL with increased connection limits
CMD ["postgres", "-c", "max_connections=500"]
