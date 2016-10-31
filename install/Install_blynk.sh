#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_blynk.sh 
### BEGIN INIT INFO
# Provides:          Install_blynk
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_blynk
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_blynk.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install Install_blynk"			| tee -a 	"$LOG_FILE"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-library" ]; then
	echo "install Install_blynk is already installed......."						| tee -a 	"$LOG_FILE"
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-library" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # 	Starting apt-get-Install_blynk		# # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"

	git clone https://github.com/blynkkk/blynk-library.git 							| tee -a 	"$LOG_FILE"
	make clean all target=raspberry 									| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"


	echo "Congratuation install Install_blynk is now installed......." 										| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #       	 Install_blynk DONE!!   	# # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"echo ""													| tee -a 	"$LOG_FILE"echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	
	exit 1
fi








exit 1
