#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_wiringPi.sh 
### BEGIN INIT INFO
# Provides:          Install_wiringPi
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_wiringPi
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_wiringPi.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]
then
	echo "You have to run this script as Superuser! in order to install Install_wiringPi"			| tee -a 	"$LOG_FILE"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/wiringPi" ]; then
	echo "install Install_wiringPi is already installed......."						| tee -a 	"$LOG_FILE"
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/wiringPi" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #     Starting apt-get-Install_wiringPi   # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	apt-get install git-core 										| tee -a 	"$LOG_FILE"
	git clone git://git.drogon.net/wiringPi 								| tee -a 	"$LOG_FILE"
	git pull origin 											| tee -a 	"$LOG_FILE"
	/home/pi/wiringPi/build 										| tee -a 	"$LOG_FILE"


	echo "Congratuation install Install_wiringPi is now installed......." 					| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        Install_wiringPi DONE!!            # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	exit 1
fi








exit 0
