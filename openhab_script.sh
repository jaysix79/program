#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/openhab_script.sh.sh 
### BEGIN INIT INFO
# Provides:          openhab_script.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: openhab_script.sh
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/openhab_script.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install openhab_script.sh"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install openhab_script.sh is already installed......."
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get openhab_script.sh  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"


	echo "Congratuation install openhab_script.sh is now installed......." 									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        openhab_script.sh DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
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