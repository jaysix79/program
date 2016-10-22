#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo /home/pi/programs/startup.sh 
##	to run blynk "node blynk.js 2f79d6db732040449192407b49934622"
##	auto start add this "/usr/local/lib/node_modules/blynk-library/blynk.js 2f79d6db732040449192407b49934622" on "sudo nano /etc/rc.local"
### BEGIN INIT INFO
# Provides:          startup
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: startup
### END INIT INFO
LOG_FILE="/home/pi/log/startup.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install startup"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install startup is already installed......."
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        Starting apt-get startup         # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"


	sudo service pi_garage_alert restart																	| tee -a 	"$LOG_FILE"
	sudo ./blynk --token=2f79d6db732040449192407b49934622	&
	echo ""																									| tee -a 	"$LOG_FILE"


	echo "Congratuation install startup is now installed......."											| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #     	     startup DONE!!      		 	# # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	exit 1
fi








exit 1
