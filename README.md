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

Usage:
1. Do Clean install (netinstall) of Debian 10 (curently tested only on 10.10) - No GUI, only ssh and main system
2. Login to your account
3. su -
4. wget https://raw.githubusercontent.com/vinci72/ssh/main/scripts/customize_install.sh
5. !!! Change script Line containing URL with public ssh key !!!!
6. bash ./customize_install.sh username
