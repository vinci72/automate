#!/bin/bash

#v 0.1beta
#jarek.z@outlook.com

#
# CUSTOMIZATION
#

#Set URL with your ssh public key URL
#Downloaded file with key must be named: authorized_keys
PKURL=https://raw.githubusercontent.com/vinci72/automate/main/authorized_keys

#
# PRE CHECKS
#

#Check arguments
if [ $# -eq 0 ]
  then
    echo "Arguments expected"
    echo "Usage: customize_install.sh username"
    exit 1
fi

#
# STEP 1
#

#SSH Public Key
mkdir /home/"$1"/.ssh
cd /home/"$1"/.ssh
wget $PKURL
cd ..
chown "$1":"$1" /home/"$1"/.ssh /home/"$1"/.ssh/authorized_keys

#Firewall with SSH allow
ufw allow ssh
ufw default deny incoming
ufw default allow outgoing
echo "y" | ufw enable

#Disable Password SSH Logins
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
service sshd restart

#STEP 2
# Not needed but usefull
# comment if not to be executed

#sudoers without password
sed -i "/# Allow members of group sudo to execute any command/a %$1 ALL=(ALL) NOPASSWD:ALL" /etc/sudoers
