#! /bin/bash

pip install gunicorn

# configures supervisor for gunicorn
cat > /etc/supervisor/conf.d/gunicorn.conf << EOF
[program:gunicorn]
directory=/app/workdir
command=/app/code/bin/gunicorn.sh
user=www-data
autostart=false
autorestart=unexpected
stopasgroup=true
stdout_logfile=/app/log/gunicorn-stdout.log
stdout_logfile_maxbytes=50MB
stdout_logfile_backups=10
stderr_logfile=/app/log/gunicorn-stderr.log
stderr_logfile_maxbytes=50MB
stderr_logfile_backups=10
EOF
