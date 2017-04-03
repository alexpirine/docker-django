#! /bin/bash

# updates the system and installs essential tools
apt-get update && apt-get upgrade -y
apt-get install -y --no-install-recommends  apt-utils software-properties-common

# sets up bash profile
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /etc/skel/.bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc

cat > /etc/skel/.bash_aliases << EOF
alias ls='ls -Fhv --si --color --group-directories-first --time-style=long-iso'
alias l='ls -l'
alias ll='ls -la'
alias llt='ll -t'
alias dir='l -X'
alias vdir='l -d'
alias genpwd="tr -dc [:print:] < /dev/urandom | tr -d '\\\`^' | fold -w 20 | head -n 1 ; tr -dc [:alnum:] < /dev/urandom | fold -w 20 | head -n 1"
EOF
mkdir /etc/skel/.ssh
chmod go-rwx /etc/skel/.ssh/

cp /etc/skel/.bash_aliases ~/
source ~/.bashrc
source ~/.bash_aliases

# installs Python 3.6
add-apt-repository -y ppa:jonathonf/python-3.6
apt-get update
apt-get install -y python3.6 python3.6-dev

# installs general libraries
apt-get install -y --no-install-recommends libxml2-dev libxslt1-dev libffi-dev libssl-dev libmysqlclient-dev acl

# installs python-related tools and libraries
apt-get install -y --no-install-recommends virtualenv python3-virtualenv python3-pip python3-setuptools python3-dev python3-wheel
pip3 install virtualenvwrapper
cat >> /etc/skel/.profile << EOF

# Python virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=python3.5
export WORKON_HOME=\$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
EOF
cp /etc/skel/.profile ~/
source ~/.profile

# installs supervisor
apt-get install -y --no-install-recommends supervisor

# configures supervisor
sed -i 's/chmod=0700/chmod=0777/g' /etc/supervisor/supervisord.conf
update-rc.d supervisor defaults
systemctl enable supervisor

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
