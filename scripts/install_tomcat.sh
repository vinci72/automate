#!/bin/bash

# START VARIABLES
#JAVA= max system memory for JAVA in MB
#
ADMIN="tajniak"
PASS="tajnehaslo"
MAXMEM=4196
# END VARIABLES

#Do System Update
apt update -y
apt update -y 

apt install tomcat9 tomcat9-admin tomcat9-user -y

cd /srv
ln -s /var/lib/tomcat9/ tomcat

echo "# Ustawienie pamieci JAVA" >> /etc/default/tomcat9
echo "JAVA_OPTS=\"\${JAVA_OPTS} -Xms1024m -Xmx$MAXMEMm -XX:MaxPermSize=512m\"" >> /etc/default/tomcat9

sed -i '/<*tomcat-users>/i <user username=\"$ADMIN\" password=\"$PASS\" roles="admin,manager,manager-gui,manager-script,admin-gui"/>' /srv/tomcat/conf/tomcat-users.xml

echo "updating UFW ... "
ufw allow 8080/tcp

echo "Restarting Tomcat service ... "
service tomcat9 restart
