#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo /home/pi/programs/XXXXXXXXXXXX.sh.sh 
### BEGIN INIT INFO
# Provides:          XXXXXXXXXXXX.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: XXXXXXXXXXXX.sh
### END INIT INFO

LOG_FILE="/home/pi/log/install/XXXXXXXXXXXX.log"
mkdir -p /home/pi/log

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install XXXXXXXXXXXX.sh"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install XXXXXXXXXXXX.sh is already installed......."
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get XXXXXXXXXXXX.sh  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"


	echo "Congratuation install XXXXXXXXXXXX.sh is now installed......." 									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        XXXXXXXXXXXX.sh DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
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
