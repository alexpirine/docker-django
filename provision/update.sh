#! /bin/bash

# updates the system and installs essential tools
apt-get update && apt-get upgrade -y
apt-get install -y --no-install-recommends  apt-utils software-properties-common
