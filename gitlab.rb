# GitLab configuration file
# This file is optional and can be mounted to /etc/gitlab/gitlab.rb for advanced customization

# External URL (how users will access GitLab)
external_url 'http://gitlab.local'

# PostgreSQL connection settings
postgresql['enable'] = false
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_host'] = "postgres"
gitlab_rails['db_username'] = "gitlab"
gitlab_rails['db_password'] = "gitlab_password"
gitlab_rails['db_database'] = "gitlabhq_production"

# Redis settings
redis['enable'] = false
gitlab_rails['redis_host'] = 'redis'
gitlab_rails['redis_port'] = 6379

# Email settings (disabled by default)
gitlab_rails['smtp_enable'] = false

# Resource optimization
prometheus['enable'] = false
prometheus_monitoring['enable'] = false
puma['worker_processes'] = 2

# Disable components you don't need to save resources
gitlab_workhorse['worker_processes'] = 2
sidekiq['concurrency'] = 4

# Backup settings
gitlab_rails['backup_keep_time'] = 604800 # 1 week in seconds