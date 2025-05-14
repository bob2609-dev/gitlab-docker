# GitLab Docker Deployment Guide

This repository contains configuration files to deploy a self-hosted GitLab instance using Docker and Docker Compose. This setup includes GitLab CE with PostgreSQL as the database backend and Redis for caching.

## Components

- **GitLab CE**: Latest Community Edition for complete DevOps platform with Git repository management
- **PostgreSQL 16**: Modern relational database for GitLab data
- **Redis 6.2**: In-memory data store for caching and background jobs

## System Requirements

- Docker Engine 19.03.0+
- Docker Compose 1.27.0+
- Minimum 4GB RAM (8GB+ recommended)
- Minimum 50GB disk space
- Linux with Docker support

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd gitlab-docker
   ```

2. Check and customize environment variables in `.env` file:
   ```bash
   # Default passwords are provided but should be changed for production use
   # GITLAB_ROOT_PASSWORD=ChangeMe123!@#
   # GITLAB_POSTGRES_PASSWORD=pg_StrongPass123!
   # GITLAB_REDIS_PASSWORD=redis_StrongPass123!
   ```

3. Build and start GitLab:
   ```bash
   # Option 1: Direct build and run
   docker-compose build
   docker-compose up -d
   
   # Option 2: Using the build script (helps with Docker credential issues)
   chmod +x build.sh
   ./build.sh
   docker-compose up -d
   ```

4. Wait for GitLab to initialize (may take several minutes)

5. Access GitLab at http://localhost:8980

6. Log in with:
   - Username: `root`
   - Password: Value of `GITLAB_ROOT_PASSWORD` from your `.env` file

## Directory Structure

```
gitlab-docker/
├── docker-compose.yml        # Main Docker Compose configuration
├── .env                      # Environment variables
├── .dockerconfig             # Docker config for credential helper workaround
├── init-gitlab.sh            # Initialization script
├── build.sh                  # Build script for Docker credential issues
├── docker-pull.sh            # Script to pull Docker images directly
├── backup-gitlab.sh          # Backup script
├── gitlab/                   # GitLab configuration
│   ├── Dockerfile            # GitLab CE custom build
│   └── gitlab.rb             # GitLab configuration template
├── postgres/                 # PostgreSQL configuration
│   └── Dockerfile            # PostgreSQL custom build
└── redis/                    # Redis configuration
    ├── Dockerfile            # Redis custom build
    └── entrypoint.sh         # Redis entrypoint script
```

## Configuration

### Ports

- HTTP: 8980 (mapped to container port 80)
- HTTPS: 6443 (mapped to container port 443)
- SSH: 2222 (mapped to container port 22)

### Data Persistence

All data is stored in Docker volumes:
- `postgres-data`: PostgreSQL database files
- `redis-data`: Redis data

Additionally, GitLab data is mapped to the `./data/gitlab/` directory with subdirectories:
- `./data/gitlab/config`: GitLab configuration
- `./data/gitlab/logs`: GitLab logs
- `./data/gitlab/data`: GitLab data files

These can be modified in the `docker-compose.yml` file.

### Volumes

The setup creates the following Docker volumes:

- `gitlab-config`: GitLab configuration files
- `gitlab-logs`: GitLab log files
- `gitlab-data`: GitLab application data
- `postgres-data`: PostgreSQL database files
- `redis-data`: Redis data

### Environment Variables

Edit the `.env` file to configure:

- `GITLAB_HOME`: Base directory for GitLab volumes
- `GITLAB_ROOT_PASSWORD`: Initial root password
- `GITLAB_POSTGRES_PASSWORD`: PostgreSQL password
- `TZ`: Time zone

## Maintenance

### Backups

Run the backup script to create a complete backup of your GitLab instance:

```bash
chmod +x backup-gitlab.sh
./backup-gitlab.sh
```

### Updates

To update GitLab to the latest version:

```bash
docker-compose pull
docker-compose down
docker-compose up -d
```

### Scaling

For larger deployments, consider:

1. Increasing resource allocations in `docker-compose.yml`
2. Setting up a separate PostgreSQL server
3. Implementing load balancing for the web interface

## Customization

For advanced customization, modify the `gitlab.rb` file and mount it to the container by uncommenting the relevant section in `docker-compose.yml`.

## Troubleshooting

### Logs

View GitLab logs:

```bash
docker-compose logs -f web
```

### Common Issues

- **502 Error**: GitLab is still starting up; wait a few minutes
- **Database Connection Error**: Verify PostgreSQL container is running
- **Permission Issues**: Check volume mount permissions

## Resources

- [GitLab Documentation](https://docs.gitlab.com/)
- [GitLab Docker Image Documentation](https://docs.gitlab.com/omnibus/docker/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## License

GitLab CE is distributed under the MIT License.
# gitlab-docker
