#!/bin/bash
#	Setting up Pi Jessie (removing pi-bluetooth and bluez to avoid install error
#	Updating and upgrading the system
#	Installing wiring PI..	
########################################################################
LOG_FILE="/home/pi/log/pi-prerequisites.log"
sudo mkdir -p /home/pi/log


sudo apt-get install libcups2 samba samba-common cups
cd /
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo echo net config workstation
sudo systemctl restart smbd.service

cd /
sudo mkdir -p /home/pi
sudo chown -R root:users /home/pi/
sudo chmod -R ug+rwx,o+rx-w /home/pi/

sudo systemctl restart smbd.service

sudo cp /home/pi/backup/samba/smb.conf /etc/samba/smb.conf
sudo useradd pi -m -G users
sudo passwd pi
sudo smbpasswd -a pi
cd /

