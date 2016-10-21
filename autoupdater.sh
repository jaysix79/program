#!/bin/bash
#	sudo /home/pi/programs/autoupdater.sh 
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

echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # # Starting autoupdater  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
date 																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
	#sudo apt-get -m dist-upgrade																															| tee -a 	"$LOG_FILE"
	#sudo apt-get -y -m upgrade																																| tee -a 	"$LOG_FILE"
	sudo apt-get update																																		| tee -a 	"$LOG_FILE"
	sudo apt-get -y dist-upgrade																																	| tee -a 	"$LOG_FILE"
	sudo apt-get autoclean																																	| tee -a 	"$LOG_FILE"
	sudo apt-get clean																																		| tee -a 	"$LOG_FILE"
	sudo apt-get -y autoremove																																| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
date																																						| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # #        autoupdater DONE!!     # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"

exit 0
