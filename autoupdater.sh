#!/bin/bash
#	sudo sh /home/pi/programs/autoupdater.sh 
#	apt-get update downloader script for cron automatization
### BEGIN INIT INFO
# Provides:          autoupdater
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: autoupdater
### END INIT INFO
LOG_FILE="/home/pi/log/autoupdater.log"


###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""												| tee -a  	"$LOG_FILE"
	echo ""												| tee -a  	"$LOG_FILE"
	echo "You have to run this script as Superuser! in order to XXXXXXXXXXXX"			| tee -a  	"$LOG_FILE"
	echo ""												| tee -a  	"$LOG_FILE"
	echo ""												| tee -a  	"$LOG_FILE"
	exit 0
fi

echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # # Starting autoupdater  # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
date 													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
	#sudo apt-get -y -m upgrade									| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	echo "Autocleaning........................"							| tee -a 	"$LOG_FILE"
	sudo apt-get autoclean										| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	echo "cleaning............................"							| tee -a 	"$LOG_FILE"
	sudo apt-get clean										| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	echo "Auto removing......................."							| tee -a 	"$LOG_FILE"
	sudo apt-get -y autoremove									| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	echo "Now system is being upgraded........"							| tee -a 	"$LOG_FILE"
	sudo apt-get update										| tee -a 	"$LOG_FILE"
	sudo apt-get -y dist-upgrade									| tee -a 	"$LOG_FILE"
	sleep 5
	
	
	echo ""												| tee -a 	"$LOG_FILE"
	echo "Autocleaning........................"							| tee -a 	"$LOG_FILE"
	sudo apt-get autoclean										| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	echo "cleaning............................"							| tee -a 	"$LOG_FILE"
	sudo apt-get clean										| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	echo "Auto removing......................."							| tee -a 	"$LOG_FILE"
	sudo apt-get -y autoremove									| tee -a 	"$LOG_FILE"
	echo ""												| tee -a 	"$LOG_FILE"
	sleep 5
	clear
	
echo ""													| tee -a 	"$LOG_FILE"
date													| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # #        autoupdater DONE!!     # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"
echo ""													| tee -a 	"$LOG_FILE"


exit 0
