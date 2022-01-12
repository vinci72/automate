#!/bin/bash

#Do System Update
apt update -y
apt update -y 

apt install tomcat9 tomcat9-admin tomcat9-user -y

cd /srv
ln -s /var/lib/tomcat9/ tomcat

echo "# Ustawienie pamieci JAVA" >> /etc/default/tomcat9
echo "JAVA_OPTS="${JAVA_OPTS} -Xms1024m -Xmx4196m -XX:MaxPermSize=512m"" >> /etc/default/tomcat9

sed -i '/<*tomcat-users>/i <user username="tajniak" password="tajnehaslo" roles="admin,manager,manager-gui,manager-script,admin-gui"/>' /srv/tomcat/conf/tomcat-users.xml

service tomcat9 restart
