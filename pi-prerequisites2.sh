#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux sudo resize2fs /dev/sda2
##	sudo sh /home/pi/programs/pi-prerequisites2.sh
#	sudo apt-get install git
#	git clone https://github.com/jaysix79/programs.git
#
### BEGIN INIT INFO
# Provides:          pi-prerequisites2.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: pi-prerequisites2.sh
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/pi-prerequisites2.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to install Install_pi_garage_alert"		| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi





confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            echo this is YES
            ;;
        *)
            echo this is NO
            ;;
    esac
}




	echo "# # # # # # # #        pi-prerequisites2.sh DONE!!         # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
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
