wget https://repo.zabbix.com/zabbix/6.4/debian/pool/main/z/zabbix-release/zabbix-release_6.4-1+debian10_all.deb
dpkg -i zabbix-release_6.4-1+debian10_all.deb
apt update
apt install zabbix-agent2 zabbix-agent2-plugin-*
ufw allow 10050/tcp
ufw allow 10051/tcp
nano /etc/zabbix/zabbix_agent2.conf
systemctl restart zabbix-agent2
systemctl enable zabbix-agent2