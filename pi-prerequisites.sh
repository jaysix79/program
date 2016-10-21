#!/bin/bash
#	Setting up Pi Jessie (removing pi-bluetooth and bluez to avoid install error
#	Updating and upgrading the system
#	Installing wiring PI..	
########################################################################

LOG_FILE="/home/pi/log/pi-prerequisites.log"
mkdir -p /home/pi/log

apt-get purge -y pi-bluetooth bluez				| tee -a 	"$LOG_FILE"
apt-get -y autoremove							| tee -a 	"$LOG_FILE"
apt-get -m update								| tee -a 	"$LOG_FILE"
apt-get  -y -m dist-upgrade						| tee -a 	"$LOG_FILE"

sleep 0
## Installing wiringPi
#apt install git-core                             | tee -a 	"$LOG_FILE"
#cd /home/pi
#git clone git://git.drogon.net/wiringPi          | tee -a 	"$LOG_FILE"
#cd /home/pi/wiringPi
#git pull origin									 | tee -a 	"$LOG_FILE"
#./build											 | tee -a 	"$LOG_FILE"
#cd /home/pi


##	Install SIP for springklers

#apt install git									| tee -a 	"$LOG_FILE"
#cd /home/pi
#git clone https://github.com/Dan-in-CA/SIP		| tee -a 	"$LOG_FILE"
#sleep 3
#cd /home/pi/SIP
#sudo python sip.py							 	| tee -a 	"$LOG_FILE"
#cd /home/pi

exit 0
