#! /bin/bash

# installs supervisor
apt-get install -y --no-install-recommends supervisor

# configures supervisor
sed -i 's/chmod=0700/chmod=0777/g' /etc/supervisor/supervisord.conf
update-rc.d supervisor defaults
systemctl enable supervisor

# configures supervisor
cat > /etc/supervisor/conf.d/celery.conf << EOF
[supervisord]
nodaemon=true

[program:celery]
directory=/app/workdir
command=/app/code/bin/celery.sh
user=www-data
autostart=false
autorestart=unexpected
stopasgroup=true
stdout_logfile=/app/log/celery-stdout.log
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
stderr_logfile=/app/log/celery-stderr.log
stderr_logfile_maxbytes=50MB
stderr_logfile_backups=10

[program:celerybeat]
directory=/app/workdir
command=/app/code/bin/celerybeat.sh
user=www-data
autostart=false
autorestart=unexpected
stopasgroup=true
stdout_logfile=/app/log/celerybeat-stdout.log
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
stderr_logfile=/app/log/celerybeat-stderr.log
stderr_logfile_maxbytes=50MB
stderr_logfile_backups=10
EOF
