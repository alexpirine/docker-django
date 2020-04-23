#! /bin/bash

# sets up folders for the applications
mkdir /app
cd /app
mkdir static media log bin workdir code
chown www-data:www-data static media workdir
chmod o-rwx,g+rwxs static media workdir
