#! /bin/bash

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
echo "source ~/.profile" >> ~/.bashrc
