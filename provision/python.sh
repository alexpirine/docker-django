#! /bin/bash

# installs Python 3.6
add-apt-repository -y ppa:jonathonf/python-3.6
apt-get update
apt-get install -y python3.6 python3.6-dev

# installs general libraries, tools
apt-get install -y --no-install-recommends libxml2-dev libxslt1-dev libffi-dev libssl-dev libmysqlclient-dev acl gcc

# installs python-related tools and libraries
apt-get install -y --no-install-recommends python3-pip python3-setuptools python3-dev python3-wheel
pip3 install -U pip
