#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo /home/pi/programs/samba_install.sh.sh 
##	to run blynk "node blynk.js 2f79d6db732040449192407b49934622"
##	auto start add this "/usr/local/lib/node_modules/blynk-library/blynk.js 2f79d6db732040449192407b49934622" on "sudo nano /etc/rc.local"
### BEGIN INIT INFO
# Provides:          samba_install.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: samba_install.sh
### END INIT INFO
LOG_FILE="/home/pi/log/samba_install.sh.log"
mkdir -p /home/pi/log/

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo "You have to run this script as Superuser! in order to install samba_install.sh"			| tee -a 	"$LOG_FILE"
	exit 1
fi

###	CHECKING IF THE FOLDER EXIST
if [ -d "/home/pi/blynk-libraryX" ]; then
	echo "install samba_install.sh is already installed......."						| tee -a 	"$LOG_FILE"
	exit 1
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/home/pi/blynk-libraryX" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #   Starting apt-get-samba_install.sh     # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"

	
	apt-get -y install libcups2 samba samba-common cups							| tee -a        "$LOG_FILE"
	sleep 2
	mv -v /etc/samba/smb.conf /etc/samba/smb.conf.bak							| tee -a        "$LOG_FILE"
	cp -rfv ~/program/backup/samba/smb.conf smb.conf							| tee -a        "$LOG_FILE"
	mkdir -pv /home/pi							 				| tee -a        "$LOG_FILE"
	chown -Rv root:pi /home/pi/							 			| tee -a        "$LOG_FILE"
	chmod -Rv ug+rwx,o+rx-w /home/pi/							 		| tee -a        "$LOG_FILE"
	systemctl restart smbd.service							 			| tee -a        "$LOG_FILE"
	clear
	echo "Adding users...."											| tee -a 	"$LOG_FILE"
	sleep 2
	useradd pi -m -G users							 				| tee -a        "$LOG_FILE"
	passwd pi							 					| tee -a        "$LOG_FILE"
	smbpasswd -a pi							 					| tee -a        "$LOG_FILE"

	echo ""													| tee -a 	"$LOG_FILE"


	echo "Congratuation install samba_install.sh is now installed......." 					| tee -a 	"$LOG_FILE"
	sleep 2
	echo													| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        samba_install.sh DONE!!       # # # # # # # # # # # # # # # # # #"		| tee -a 	"$LOG_FILE"
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
