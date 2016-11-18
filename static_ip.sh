#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/static_ip.sh 
### BEGIN INIT INFO
# Provides:          static_ip.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: static_ip.sh
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/static_ip.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to static_ip"					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi

###	CHECKING IF THE FOLDER EXIST
if [ -f "xxx" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install static_ip is already installed......."							| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi


###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #  Starting apt-get static_ip.sh  # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	## MAKING IP ADDRESS STATIC	
	echo "changing IP address to static XXX.XXX.XX.5"							| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	sleep 5
	mv -v /etc/dhcpcd.conf /etc/dhcpcd.conf.bak								| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/network/dhcpcd.conf /etc/dhcpcd.conf					| tee -a        "$LOG_FILE"
	echo "IP address to static XXX.XXX.XX.5 .................."						| tee -a 	"$LOG_FILE"
	sleep 5
	

	echo "Congratuation install static_ip.sh is now installed......." 					| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        static_ip.sh DONE!!     	  # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	exit 1
fi








exit 1
