#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_blynk_latest.sh 
##	to run blynk "node blynk.js 2f79d6db732040449192407b49934622"
##	auto start add this "/usr/local/lib/node_modules/blynk-library/blynk.js 2f79d6db732040449192407b49934622" on "sudo nano /etc/rc.local"
### BEGIN INIT INFO
# Provides:          Install_blynk_latest
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_blynk_latest
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_blynk_latest.log"							| tee -a 	"$LOG_FILE"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install Install_blynk_latest"		| tee -a 	"$LOG_FILE"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install Install_blynk_latest is already installed......."						| tee -a 	"$LOG_FILE"
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get-Install_blynk_latest  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	
	
	curl -sLS https://apt.adafruit.com/add | sudo bash							| tee -a 	"$LOG_FILE"
	sudo apt-get install node										| tee -a 	"$LOG_FILE"
	sudo node -v												| tee -a 	"$LOG_FILE"
	apt-get install build-essential										| tee -a 	"$LOG_FILE"
	sudo npm install -g npm											| tee -a 	"$LOG_FILE"
	sudo npm install -g onoff										| tee -a 	"$LOG_FILE"
	sudo npm install -g blynk-library									| tee -a 	"$LOG_FILE"

	echo ""													| tee -a 	"$LOG_FILE"


	echo "Congratuation install Install_blynk_latest is now installed......." 				| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        Install_blynk_latest DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	exit 1
fi








exit 1
