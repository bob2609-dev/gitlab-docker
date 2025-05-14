FROM gitlab/gitlab-ce:latest

# Install additional packages and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    openssh-server \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Configure GitLab
RUN mkdir -p /etc/gitlab/ssl && \
    chmod 755 /etc/gitlab/ssl && \
    mkdir -p /var/opt/gitlab && \
    chown -R git:git /var/opt/gitlab

# Copy configuration files
COPY gitlab.rb /etc/gitlab/gitlab.rb

# Set proper permissions
RUN chmod 600 /etc/gitlab/gitlab.rb && \
    chown root:root /etc/gitlab/gitlab.rb

# Set system parameters
RUN echo '* soft nofile 524288' >> /etc/security/limits.conf && \
    echo '* hard nofile 524288' >> /etc/security/limits.conf && \
    echo 'fs.file-max = 524288' >> /etc/sysctl.conf && \
    echo 'session required pam_limits.so' >> /etc/pam.d/common-session && \
    echo 'session required pam_limits.so' >> /etc/pam.d/common-session-noninteractive

# Set up custom directories
RUN mkdir -p /var/opt/gitlab/gitlab-rails/uploads \
    && mkdir -p /var/opt/gitlab/gitlab-rails/shared \
    && mkdir -p /var/opt/gitlab/gitlab-rails/tmp \
    && mkdir -p /var/opt/gitlab/gitlab-rails/public

# Set permissions
RUN chown -R git:git /var/opt/gitlab/gitlab-rails \
    && chmod -R 755 /var/opt/gitlab/gitlab-rails

# Create log directory
RUN mkdir -p /var/log/gitlab

# Set working directory
WORKDIR /var/opt/gitlab

# Expose web and SSH ports
EXPOSE 80 443 22

# This is how GitLab will be started
ENTRYPOINT ["/assets/init-container"]
CMD ["/assets/wrapper"]