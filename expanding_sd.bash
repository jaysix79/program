#!/bin/bash
#	Setting up Pi Jessie (removing pi-bluetooth and bluez to avoid install error
#	Updating and upgrading the system
#	Installing wiring PI..	
########################################################################

LOG_FILE="/home/pi/log/expanding_sd.log"
mkdir -p /home/pi/log

sudo apt-get purge -y pi-bluetooth bluez				| tee -a 	"$LOG_FILE"
sudo apt-get -y autoremove								| tee -a 	"$LOG_FILE"
sudo apt-get -m update									| tee -a 	"$LOG_FILE"
sudo apt-get  -y -m dist-upgrade						| tee -a 	"$LOG_FILE"

sleep 0
## Installing wiringPi
sudo apt install git-core                            		| tee -a 	"$LOG_FILE"
cd /home/pi
sudo git clone git://git.drogon.net/wiringPi          	| tee -a 	"$LOG_FILE"
cd /home/pi/wiringPi
sudo git pull origin									| tee -a 	"$LOG_FILE"
sudo ./build											 		| tee -a 	"$LOG_FILE"
cd /home/pi


##	Install SIP for springklers

apt install git											| tee -a 	"$LOG_FILE"
cd /home/pi
sudo git clone https://github.com/Dan-in-CA/SIP			| tee -a 	"$LOG_FILE"
sleep 3
cd /home/pi/SIP
sudo python sip.py							 			| tee -a 	"$LOG_FILE"
cd /home/pi

##	Install SAMBA for springklers
mkdir -p /home/pi/log
sudo apt install samba
sudo apt-get install samba-common-bin

exit 0
