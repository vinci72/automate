#!/bin/bash

#v 0.1beta
#jarek.z@outlook.com

#
# CUSTOMIZATION
#

#
# STEP 1
#

#Package Installation
apt install net-tools iptraf-ng cifs-utils genisoimage squashfs-tools xorriso curl wget -y

#VEEAM AGENT FREE Instalation
cd /root
wget https://github.com/vinci72/automate/raw/main/veeam-release-deb_1.0.8_amd64.deb

dpkg -i ./veeam-release* && apt-get update
apt install veeam -y

# add veeam last backup status file
crontab -l | { cat; echo "0 23 * * * veeamconfig session list --24 | sed -e '1d;3d' >> /var/log/kopiaveeam.log"; } | crontab -
