#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux sudo resize2fs /dev/sda2
##	sudo sh /home/pi/programs/pi-prerequisites.sh
#	sudo apt-get install git
#	git clone https://github.com/jaysix79/programs.git
#
### BEGIN INIT INFO
# Provides:          pi-prerequisites.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: pi-prerequisites.sh
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/pi-prerequisites.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to install Install_pi_garage_alert"		| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/xxxx" ]; then
	clear
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #  Starting apt-get pi-prerequisites.sh   # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "You are Running the pi-prerequisites.sh script. This script is best to run right after a fresh Pi Installation" 												| tee -a 	"$LOG_FILE"
		
	read -r -p "Are You Sure you want to continue? [Y/n] " input

	case $input in
	    [yY][eE][sS]|[yY])
			echo "Yes"
			;;

	    [nN][oO]|[nN])
			echo "No"
			;;

	    *)
		echo "Invalid input..."
		exit 1
		;;
	esac

	
	echo "# # # # # # # #        pi-prerequisites.sh DONE!!         # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	
	exit 1
fi








exit 1
