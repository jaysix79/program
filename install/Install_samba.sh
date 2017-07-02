#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_samba.sh
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

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/samba_install.sh.log"

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

	
	echo "Installing samba........................................."					| tee -a 	"$LOG_FILE"
	sleep 2
	#apt-get -y install libcups2 samba samba-common cups							| tee -a        "$LOG_FILE"
	apt-get update				 								| tee -a        "$LOG_FILE"
	apt-get -y install samba samba-common-bin 								| tee -a        "$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo "Finalizing samba........................................."					| tee -a 	"$LOG_FILE"
	mv -v /etc/samba/smb.conf /etc/samba/smb.conf.bak							| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/samba/smb.conf /etc/samba/smb.conf					| tee -a        "$LOG_FILE"
	mkdir -p /home/pi							 				| tee -a        "$LOG_FILE"
	chown -R root:pi /home/pi/							 			| tee -a        "$LOG_FILE"
	chmod -R ug+rwx,o+rx-w /home/pi/							 		| tee -a        "$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	systemctl restart smbd.service							 			| tee -a        "$LOG_FILE"
	#adding pi							 					| tee -a        "$LOG_FILE"
	sleep 3
	clear
	useradd pi -m -G users							 				| tee -a        "$LOG_FILE"
	echo "Pi USER password......." 										| tee -a 	"$LOG_FILE"
	passwd pi							 					| tee -a        "$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo													| tee -a 	"$LOG_FILE"
	echo "Password for user "Pi" on SAMABA......." 								| tee -a 	"$LOG_FILE"
	smbpasswd -a pi							 					| tee -a        "$LOG_FILE"
	#echo													| tee -a 	"$LOG_FILE"
	#echo													| tee -a 	"$LOG_FILE"
	#echo													| tee -a 	"$LOG_FILE"
	#echo "Password for user "homeassistant" on SAMABA......." 						| tee -a 	"$LOG_FILE"
	#smbpasswd -a homeassistant										| tee -a 	"$LOG_FILE"	
	#echo													| tee -a 	"$LOG_FILE"
	#echo													| tee -a 	"$LOG_FILE"
	#echo													| tee -a 	"$LOG_FILE"
	#echo "Congratuation install samba_install.sh is now installed......." 					| tee -a 	"$LOG_FILE"
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
