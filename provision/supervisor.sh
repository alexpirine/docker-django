#! /bin/bash

# installs supervisor
apt-get install -y --no-install-recommends supervisor

# configures supervisor
sed -i 's/chmod=0700/chmod=0777/g' /etc/supervisor/supervisord.conf
update-rc.d supervisor defaults
systemctl enable supervisor
