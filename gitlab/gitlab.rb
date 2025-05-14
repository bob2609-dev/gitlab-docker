external_url 'http://localhost:8980'

# Database settings
postgresql['enable'] = false
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'unicode'
gitlab_rails['db_host'] = 'postgres'
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = '${GITLAB_POSTGRES_PASSWORD}'
gitlab_rails['db_database'] = 'gitlabhq_production'

# Redis settings
redis['enable'] = false
gitlab_rails['redis_host'] = 'redis'
gitlab_rails['redis_port'] = 6379
gitlab_rails['redis_password'] = '${GITLAB_REDIS_PASSWORD}'

# Email settings
gitlab_rails['smtp_enable'] = false

# GitLab Shell settings
gitlab_shell['dir'] = '/var/opt/gitlab/gitlab-shell'
gitlab_shell['gitlab_user'] = 'git'
gitlab_shell['gitlab_url'] = 'http://localhost:8980'

# GitLab Workhorse settings
gitlab_workhorse['listen_network'] = 'tcp'
gitlab_workhorse['listen_addr'] = '0.0.0.0:8181'

# GitLab Rails settings
gitlab_rails['gitlab_shell_ssh_port'] = 22
gitlab_rails['gitlab_shell_ssh_host'] = 'localhost'
gitlab_rails['gitlab_shell_ssh_user'] = 'git'

# GitLab Pages settings
gitlab_pages['enable'] = false

# Sidekiq settings
sidekiq['enable'] = true

# Gitaly settings
gitaly['enable'] = true

# GitLab Registry settings
registry['enable'] = false

# GitLab Mattermost settings
mattermost['enable'] = false

# Nginx settings
nginx['enable'] = true
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['redirect_http_to_https'] = false
nginx['redirect_http_to_https_port'] = 80
nginx['ssl_certificate'] = nil
nginx['ssl_certificate_key'] = nil

# Web server settings
web_server['external_users'] = ['gitlab-www']
web_server['username'] = 'gitlab-www'
web_server['groupname'] = 'gitlab-www'

# Puma settings (replaces Unicorn in newer GitLab versions)
puma['enable'] = true
puma['worker_processes'] = 2
puma['listen'] = '127.0.0.1'
puma['port'] = 8080
puma['tcp_nopush'] = true
puma['tcp_nodelay'] = true
puma['preload_app'] = true

# Log settings
gitlab_rails['log_level'] = 'info'
gitlab_rails['log_format'] = 'json'
