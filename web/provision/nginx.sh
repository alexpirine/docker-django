#! /bin/bash

apt-get install -y nginx

# pre-configures nginx for production
mkdir -p /var/log/nginx/
cat > /etc/nginx/sites-enabled/default << EOF
server {
    listen 80;
    server_name localhost;
    return 301 https://\$server_name\$request_uri;
}

server {
    listen 443 ssl;
    server_name localhost;

    if (\$host != \$server_name) {
        return 444;
    }

    root /home/www/$CONF_APP_NAME/static;

    location /static/ {
        alias /home/www/$CONF_APP_NAME/static/;
    }

    location /upload/ {
        alias /home/www/$CONF_APP_NAME/upload/;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/tmp/gunicorn-$CONF_APP_NAME.sock;
    }

    client_max_body_size 100M;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    add_header Strict-Transport-Security "max-age=31536000" always;
    ssl_ciphers "ECDH+AES:!aNULL";
    ssl_certificate /etc/letsencrypt/live/localhost/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/localhost/privkey.pem;
}
EOF
