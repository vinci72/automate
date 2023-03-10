wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
echo "deb https://artifacts.elastic.co/packages/oss-8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
apt update
apt install filebeat
systemctl enable filebeat.service
wget https://github.com/Graylog2/collector-sidecar/releases/download/1.2.0/graylog-sidecar_1.2.0-1_amd64.deb
dpkg -i graylog-sidecar_1.2.0-1_amd64.deb
graylog-sidecar -service install
nano /etc/graylog/sidecar/sidecar.yml
systemctl start graylog-sidecar.service
apt install filebeat
systemctl enable filebeat.service
service filebeat start
systemctl status graylog-sidecar.service
service filebeat status