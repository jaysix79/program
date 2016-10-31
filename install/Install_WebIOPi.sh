#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_WebIOPi.sh 
### BEGIN INIT INFO
# Provides:          Install_WebIOPi
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_WebIOPi
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_WebIOPi.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]
then
	echo "You have to run this script as Superuser! in order to install Install_WebIOPi"					| tee -a 	"$LOG_FILE"
	exit 0
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/WebIOPi-0.7.1d" ]; then
	echo "install Install_WebIOPi is already installed......."												| tee -a 	"$LOG_FILE"
	exit 0
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/WebIOPi-0.7.1d" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get-Install_WebIOPi  # # # # # # # # # # # # # # # # # # #"			| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	cd /home/pi
	wget http://sourceforge.net/projects/webiopi/files/WebIOPi-0.7.1.tar.gz 								| tee -a 	"$LOG_FILE"
	tar xvzf /home/pi/WebIOPi-0.7.1.tar.gz 																	| tee -a 	"$LOG_FILE"
	cd /home/pi/WebIOPi-0.7.1																				| tee -a 	"$LOG_FILE"
	sudo /home/pi/WebIOPi-0.7.1/setup.sh 																	| tee -a 	"$LOG_FILE"
	rm /home/pi/WebIOPi-0.7.1.tar.gz																		| tee -a 	"$LOG_FILE"
	sudo update-rc.d webiopi defaults																		| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	echo "Congratuation install Install_WebIOPi is now installed......." 									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        Install_WebIOPi DONE!!       # # # # # # # # # # # # # # # # # #"			| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	
	
	exit 0
fi








exit 0
