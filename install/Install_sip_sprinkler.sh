#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_sip_sprinkler.sh 
### BEGIN INIT INFO
# Provides:          Install_sip_sprinkler
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_sip_sprinkler
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_sip_sprinkler.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ];then
	echo "You have to run this script as Superuser! in order to install sip_sprinkler"			| tee -a 	"$LOG_FILE"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/SIP" ]; then
	echo "install sip_sprinkler is already installed......."						| tee -a 	"$LOG_FILE"
	service sip status 											| tee -a 	"$LOG_FILE"
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/SIP" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get-Install_sip_sprinkler  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	apt-get install git											| tee -a 	"$LOG_FILE"	
	
	echo "Downloading the source........ "									| tee -a 	"$LOG_FILE"
	git clone https://github.com/jaysix79/SIP 								| tee -a 	"$LOG_FILE"
	sleep 2
	
	clear
	
	cp -v /home/pi/SIP/sip.sh /etc/init.d/sip 								| tee -a 	"$LOG_FILE"
	chmod +x /etc/init.d/sip 										| tee -a 	"$LOG_FILE"
	update-rc.d sip defaults 										| tee -a 	"$LOG_FILE"
	sudo python /home/pi/SIP/sip.py 									| tee -a 	"$LOG_FILE"
	echo "sudo python /home/pi/SIP/sip.py"
	service sip status 											| tee -a 	"$LOG_FILE"
	sleep 2
	echo "Congratuation install sip_sprinkler is now installed......." 					| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        Install_sip_sprinkler DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	

	exit 1
fi








exit 0
