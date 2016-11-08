
#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/git_clone.sh 
### BEGIN INIT INFO
# Provides:          git_clone.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: git_clone.sh
### END INIT INFO
mkdir -p /home/pi/log/install/
LOG_FILE="/home/pi/log/install/git_clone.log"

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
if [ -f "xxx" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install Install_pi_garage_alert is already installed......."					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi


###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "xxx" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #	 Starting apt-get git_clone.sh 	      # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 					                                              			| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	
	
	git clone https://github.com/jaysix79/programs.git temp							| tee -a 	"$LOG_FILE"
	cp -rf  /home/pi/temp/* /home/pi/programs								| tee -a 	"$LOG_FILE"
	rm -rf temp												| tee -a 	"$LOG_FILE"
	chmod +x -Rv ./programs											| tee -a 	"$LOG_FILE"


	echo "Congratuation downloaded git_clone.sh is now installed......." 					| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #      	  git_clone.sh DONE!!       	# # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"

	exit 1
fi








exit 1
