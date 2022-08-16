#!/bin/sh
yum update -y
yum install wget perl screen -y
VPSUSER={{username}}
echo $VPSUSER
HOSTNAME={{vps_hostname}}
IFS="." read -a HOSTNAME_ARR <<< $HOSTNAME
USERNAME=${HOSTNAME_ARR[1]}
CONTACTEMAIL=contact@floohost.ml
DOMAIN="${HOSTNAME_ARR[1]}.${HOSTNAME_ARR[2]}"
systemctl get-default
whoami
su root
sleep 5
cd /home
wget https://securedownloads.cpanel.net/latest
sh latest 
sleep 5
while screen -list | grep cpanelinstall
do
    sleep 10
done
echo "Script Finished"
