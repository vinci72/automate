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
# nano /etc/postgresql/11/radix/pg_hba.conf
cp /etc/postgresql/11/radix/pg_hba.conf /etc/postgresql/11/radix/pg_hba.conf.backup
# sed -i "/host    all             all             127.0.0.1/32            md5/a host    all             all             192.168.1.0/24          md5" /etc/postgresql/11/radix/pg_hba.conf
nano /etc/postgresql/11/radix/pg_hba.conf

# nano /etc/default/autopostgresqlbackup
cp /etc/default/autopostgresqlbackup /etc/default/autopostgresqlbackup.backup
# sed -i 's/BACKUPDIR="/var/lib/autopostgresqlbackup"/BACKUPDIR="/backup"/g' /etc/default/autopostgresqlbackup
nano /etc/default/autopostgresqlbackup

# Change postgres password
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password '123456';"

# Restart postgreSQl service
service postgresql restart
