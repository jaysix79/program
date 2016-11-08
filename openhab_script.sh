#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/openhab_script.sh
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
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to install Install_pi_garage_alert"		| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi

###	CHECKING IF THE FOLDER EXIST
if [ -f "xxxxx" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install Install_pi_garage_alert is already installed......."					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi


###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "xxxx" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # Starting apt-get openhab_script.sh  # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	
	
	## INSTALLING OPENHAB 2 ON PI
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"
	sleep 5
	apt-get install screen mc vim git htop									| tee -a 	"$LOG_FILE"
	apt-get install oracle-java8-jdk									| tee -a 	"$LOG_FILE"
	echo 'deb http://dl.bintray.com/openhab/apt-repo2 testing main' | sudo tee /etc/apt/sources.list.d/openhab2.list
	wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab' | sudo apt-key add -

	echo 'deb https://openhab.ci.cloudbees.com/job/openHAB-Distribution/ws/distributions/openhab-offline/target/apt-repo/ /' | sudo tee /etc/apt/sources.list.d/openhab2.list
	echo 'deb https://openhab.ci.cloudbees.com/job/openHAB-Distribution/ws/distributions/openhab-online/target/apt-repo/ /' | sudo tee --append /etc/apt/sources.list.d/openhab2.list

	wget -qO - 'http://www.openhab.org/keys/public-key-snapshots.asc' | sudo apt-key add -
	apt-get install apt-transport-https									| tee -a 	"$LOG_FILE"
	apt-get update												| tee -a 	"$LOG_FILE"
	apt-get install openhab2-offline									| tee -a 	"$LOG_FILE"

	systemctl start openhab2.service									| tee -a 	"$LOG_FILE"
	systemctl status openhab2.service									| tee -a 	"$LOG_FILE"

	systemctl daemon-reload											| tee -a 	"$LOG_FILE"
	systemctl enable openhab2.service									| tee -a 	"$LOG_FILE"

	echo "Congratuation install openhab_script.sh is now installed......." 					| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	sleep 5
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        openhab_script.sh DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	echo " "												| tee -a 	"$LOG_FILE"
	
	exit 1
fi








exit 1
