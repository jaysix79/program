#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo /home/pi/programs/pi-prerequisites.sh.sh 
### BEGIN INIT INFO
# Provides:          pi-prerequisites.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: pi-prerequisites.sh
### END INIT INFO

LOG_FILE="/home/pi/log/install/pi-prerequisites.log"
mkdir -p /home/pi/log

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install pi-prerequisites.sh"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install pi-prerequisites.sh is already installed......."
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get pi-prerequisites.sh  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"
	sleep 2
	apt-get purge -y pi-bluetooth bluez									| tee -a 	"$LOG_FILE"
	apt-get -y autoremove							        			| tee -a 	"$LOG_FILE"
	apt-get -m update								          		| tee -a 	"$LOG_FILE"
	apt-get  -y -m dist-upgrade					    					| tee -a 	"$LOG_FILE"

	sleep 4

	echo ""																									| tee -a 	"$LOG_FILE"
	clear
	echo "Installing samba........................................."					| tee -a 	"$LOG_FILE"
	sleep 2
	apt-get -y install libcups2 samba samba-common cups							| tee -a        "$LOG_FILE"
	sleep 2
	clear
	mv -v /etc/samba/smb.conf /etc/samba/smb.conf.bak							| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/samba/smb.conf /etc/samba/smb.conf					| tee -a        "$LOG_FILE"
	mkdir -pv /home/pi							 				| tee -a        "$LOG_FILE"
	mkdir -pv /usr/share/openhabi							 			| tee -a        "$LOG_FILE"
	mkdir -pv /etc/openhab							 				| tee -a        "$LOG_FILE"
	chown -hRv openhab:openhab /etc/openhab									| tee -a        "$LOG_FILE"
	chown -hRv openhab:openhab /etc/openhab									| tee -a        "$LOG_FILE"
	chown -Rv root:pi /home/pi/							 			| tee -a        "$LOG_FILE"
	chmod -Rv ug+rwx,o+rx-w /home/pi/							 		| tee -a        "$LOG_FILE"
	
	systemctl restart smbd.service							 			| tee -a        "$LOG_FILE"
	#adding pi							 					| tee -a        "$LOG_FILE"
	useradd pi -m -G users							 				| tee -a        "$LOG_FILE"
	passwd pi							 					| tee -a        "$LOG_FILE"
	smbpasswd -a pi							 					| tee -a        "$LOG_FILE"

	echo ""																									| tee -a 	"$LOG_FILE"
	
	mv -v /etc/dhcpcd.conf /etc/dhcpcd.conf.bak								| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/network/dhcpcd.conf /etc/dhcpcd.conf					| tee -a        "$LOG_FILE"


	echo "Congratuation install pi-prerequisites.sh is now installed......." 									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        pi-prerequisites.sh DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo																								 	                                                | tee -a 	"$LOG_FILE"
	echo																									                                                | tee -a 	"$LOG_FILE"
	echo																									                                                | tee -a 	"$LOG_FILE"
	echo																									                                                | tee -a 	"$LOG_FILE"
	echo																									                                                | tee -a 	"$LOG_FILE"
	echo																									                                                | tee -a 	"$LOG_FILE"

	exit 1
fi








exit 1
