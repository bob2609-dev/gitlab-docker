# GitLab Docker Deployment Guide

This repository contains configuration files to deploy a self-hosted GitLab instance using Docker and Docker Compose. This setup includes GitLab CE with PostgreSQL as the database backend and Redis for caching.

## Components

- **GitLab CE**: A complete DevOps platform with Git repository management
- **PostgreSQL**: Relational database for GitLab data
- **Redis**: In-memory data store for caching and background jobs

## System Requirements

- Docker Engine 19.03.0+
- Docker Compose 1.27.0+
- Minimum 4GB RAM (8GB+ recommended)
- Minimum 50GB disk space
- Linux/macOS/Windows with Docker support

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd gitlab-docker
   ```

2. Configure environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your preferred settings
   ```

3. Start GitLab:
   ```bash
   chmod +x setup-gitlab.sh
   ./setup-gitlab.sh
   ```

4. Wait for GitLab to initialize (may take a few minutes)

5. Access GitLab at http://localhost (or the configured host)

6. Log in with username `root` and the password from your .env file

## Directory Structure

```
gitlab-docker/
├── docker-compose.yml   # Main Docker Compose configuration
├── .env                 # Environment variables
├── setup-gitlab.sh      # Setup script
├── backup-gitlab.sh     # Backup script
└── gitlab.rb            # Optional GitLab configuration
```

## Configuration

### Ports

- HTTP: 80
- HTTPS: 443
- SSH: 22

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
