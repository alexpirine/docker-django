#! /bin/bash

source ~/.profile

# sets up folders for the applications
mkdir /app
cd /app
mkdir static media log worker workdir code
chown www-data:www-data static media
chmod o-rwx,g+rwxs static media
setfacl -dm g::rwx static media
