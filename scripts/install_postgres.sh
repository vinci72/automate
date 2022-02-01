#!/bin/bash

#v 0.1beta
#jarek.z@outlook.com

#
# CUSTOMIZATION
#

# Install packages
apt update -y
apt upgrade -y
apt install postgresql-11 postgresql-client-11 autopostgresqlbackup p7zip -y

# Configure instance
pg_dropcluster 11 main --stop
pg_createcluster -d /srv/radix -p 5432 11 radix
pg_ctlcluster 11 radix start

# Add Crontab Job
crontab -l > cron.kopia
echo "30 16 * * * /usr/sbin/autopostgresqlbackup" >> cron.kopia
crontab cron.kopia
rm cron.kopia

# Add Firewall rules
ufw allow 5432/tcp

# Edit conf files
nano /etc/postgresql/11/radix/pg_hba.conf
nano /etc/default/autopostgresqlbackup