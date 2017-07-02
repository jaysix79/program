#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/homeassistant_initializing.sh 
### BEGIN INIT INFO
# Provides:          homeassistant_initializing.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: homeassistant_initializing.sh
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/homeassistant_initializing.sh.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to homeassistant_initializing.sh"		| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi

###	CHECKING IF THE FOLDER EXIST
if [ -f "xxx" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install homeassistant_initializing is already installed......."					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi


###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get homeassistant_initializing.sh  # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	
	systemctl stop home-assistant@homeassistant.service 							| tee -a 	"$LOG_FILE"
	su -s /bin/bash homeassistant										| tee -a 	"$LOG_FILE"
	echo source /srv/homeassistant/bin/activate									| tee -a 	"$LOG_FILE"
	pip3 install --upgrade homeassistant									| tee -a 	"$LOG_FILE"
	sleep 5
	echo exit
	systemctl start home-assistant@homeassistant.service							| tee -a 	"$LOG_FILE"
	
	
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"


	echo "Congratuation install homeassistant_initializing.sh is now installed......." 			| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        homeassistant_initializing.sh DONE!!       # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"
	echo								                             	        | tee -a 	"$LOG_FILE"


	exit 1
fi








exit 1
