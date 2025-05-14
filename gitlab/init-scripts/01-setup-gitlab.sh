#!/bin/bash

# Setup GitLab directories
mkdir -p /var/opt/gitlab/gitlab-rails/uploads
mkdir -p /var/opt/gitlab/gitlab-rails/shared
mkdir -p /var/opt/gitlab/gitlab-rails/tmp
mkdir -p /var/opt/gitlab/gitlab-rails/public

# Set permissions
chown -R git:git /var/opt/gitlab/gitlab-rails
chmod -R 755 /var/opt/gitlab/gitlab-rails

# Initialize GitLab Shell
gitlab-shell-init

# Reconfigure GitLab
gitlab-ctl reconfigure
