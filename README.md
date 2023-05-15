# ssh
Customize install script  
  
Post installation script makes admin live much easier.  
Default actions:  
- Update syystem  
- Install main packages (mc, net-tools, etc...)  
- Install Veeam Agent Free for Linux  
- Install ssh key for specified user (argument No.1)  
- Install Firewall (UFW) and allow only ssh connection  
- Modify ssh deamon to disallow password logins  
- Install tomcat9 default instance (8080) and  

Usage:  
Do Clean install (netinstall) of Debian 10 (curently tested only on 10.10) - No GUI, only ssh and main system  
Login to your account  
su -  

== BASIC TOOLS ==  
wget https://raw.githubusercontent.com/vinci72/automate/main/scripts/customize_install.sh  
!!! Change script Line containing URL with public ssh key !!!!  
bash ./customize_install.sh username  

== TOMCAT 9 ==  
wget https://raw.githubusercontent.com/vinci72/automate/main/scripts/install_tomcat.sh  
nano ./install_tomcat.sh  
!!! Change tomcat admin username and password. Adjust JAVA MAX memory (default 4GB) !!!  
bash ./install_tomcat.sh  

== GRAYLOG Sidecars (Linux) ==  
wget https://raw.githubusercontent.com/vinci72/automate/main/scripts/graylog_linux_client.sh  
bash ./graylog_linux_client.sh  
  
== Zabbix2-agent (Linux) ==  
wget https://raw.githubusercontent.com/vinci72/automate/main/scripts/zabbix2.sh  
bash ./zabbix2.sh  ZABBIX_SERVER_IP
