#!/bin/bash

#v 0.1beta
#jarek.z@outlook.com

#
# CUSTOMIZATION
#

#Set URL with your ssh public key URL
#Downloaded file with key must be named: authorized_keys
PKURL=https://raw.githubusercontent.com/vinci72/ssh/main/authorized_keys

#
# PRE CHECKS
#

#Check if we hav arguments
if [ $# -eq 0 ]
  then
    echo "Arguments expected"
    echo "Usage: customize_install.sh username"
    exit 1
fi

#
# STEP 1
#

#Do System Update
apt update -y
apt upgrade -y 

#Package Installation
apt install mc open-vm-tools net-tools iptraf-ng cifs-utils genisoimage squashfs-tools xorriso ufw curl wget -y

#SSH Public Key
mkdir /home/"$1"/.ssh
cd /home/"$1"/.ssh
wget $PKURL
cd ..
chown "$1":"$1" /home/"$1"/.ssh /home/"$1"/.ssh/authorized_keys

#VEEAM AGENT FREE Instalation
cd /root
wget https://github.com/vinci72/ssh/raw/main/veeam-release-deb_1.0.8_amd64.deb

dpkg -i ./veeam-release* && apt-get update
apt install veeam -y

#Firewall with SSH allow
ufw allow ssh
ufw default deny incoming
ufw default allow outgoing
ufw enable --force

#Disable Password SSH Logins
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
service sshd restart

#STEP 2
#To be continued ...
