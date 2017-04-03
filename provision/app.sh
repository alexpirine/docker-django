#! /bin/bash

source ~/.bashrc

# sets up folders for the applications
mkdir /app
cd /app
mkdir static media log worker workdir code
chown www-data:www-data static media
chmod o-rwx,g+rwxs static media
setfacl -dm g::rwx static media

# sets up Python virtualenv
cd /app/code
mkvirtualenv -p python3.6 -a . app
pip install -U pip
