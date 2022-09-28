apt install apache2 -y
systemctl start apache2
systemctl enable  apache2

a2enmod ssl
systemctl restart apache2
a2ensite default-ssl
systemctl reload apache2

apt install mariadb-server mariadb-client -y
mysql_secure_installation 

apt install php libapache2-mod-php php-mysql php-mbstring php-curl php-gd php-xml php-intl php-ldap php-apcu php-xmlrpc php-cas php-zip php-bz2 php-ldap php-imap php-soap php-opcache php-php-gettext php-dev -y

mkdir /etc/include
mkdir /etc/include/apache2
