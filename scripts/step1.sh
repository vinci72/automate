#!/bin/bash

#Do System Update
apt update -y
apt upgrade -y 

#Package Installation
apt install mc open-vm-tools net-tools iptraf-ng cifs-utils genisoimage squashfs-tools xorriso ufw curl wget -y

#SSH Public Key
mkdir /home/jzawadzki/.ssh
cd /home/jzawadzki/.ssh
wget https://github.com/vinci72/ssh/blob/main/authorized_keys
cd ..
chown jzawadzki:jzawadzki /home/jzawadzki/.ssh /home/jzawadzki/.ssh/authorized_keys

#VEEAM AGENT FREE Instalation
cd /root
wget https://github.com/vinci72/ssh/blob/main/veeam-release-deb_1.0.8_amd64.deb

dpkg -i ./veeam-release* && apt-get update
apt install veeam -y
