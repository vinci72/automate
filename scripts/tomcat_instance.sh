#!/bin/bash

#Check arguments
if [ $# -eq 0 ]
  then
    echo "Arguments expected"
    echo "Usage: customize_install.sh username"
    exit 1
fi

re='^[0-9]+$'
if ! [[ "$1" =~ $re ]] ; then
   echo "error arg 1: Not a number" >&2; exit 1
fi

if ! [[ "$2" =~ $re ]] ; then
   echo "error arg 2: Not a number" >&2; exit 1
fi

tomcat9-instance-create -p "$1" -c "$2" /srv/tomcat9-"$1"

echo "updating UFW ... "
ufw allow "$1"/tcp

nano /etc/systemd/system/tomcat9-$1.service
