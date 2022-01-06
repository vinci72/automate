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
Do Clean install (netinstall) of Debian 10 (curently tested only on 10.10) - No GUI, only ssh and main system
Login to your account
su -
wget https://raw.githubusercontent.com/vinci72/ssh/main/scripts/customize_install.sh
!!! Customize script Line containingURL with private ssh key !!!!
bash ./customize_install.sh jzawadzki
