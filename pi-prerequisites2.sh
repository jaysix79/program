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

###	CHECKING IF THE FOLDER EXIST
if [ -f "/usr/local/sbin/pi_garage_alert.py" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install Install_pi_garage_alert is already installed......."					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -d "/xxxx" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #  Starting apt-get pi-prerequisites.sh   # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 													| tee -a 	"$LOG_FILE"
	dpkg --configure -a											| tee -a 	"$LOG_FILE"
	sh /home/pi/programs/git_clone.sh 									| tee -a 	"$LOG_FILE"
	
	## REMOVING UNNEEDED STUFF
	echo "Removing unneeded stuff.........."								| tee -a 	"$LOG_FILE"
	sleep 5
	#apt-get purge -y pi-bluetooth bluez									| tee -a 	"$LOG_FILE"
	#apt-get -y autoremove							        			| tee -a 	"$LOG_FILE"
	apt-get -y update								          		| tee -a 	"$LOG_FILE"
	apt-get -y upgrade						    					| tee -a 	"$LOG_FILE"
	echo "Unneeded stuff removed..........."								| tee -a 	"$LOG_FILE"
	sleep 5
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	clear
	
	
	## INSTALLING SAMBA
	echo "Installing samba........................................."					| tee -a 	"$LOG_FILE"
	sleep 5
	#apt-get -y install libcups2 samba samba-common cups							| tee -a        "$LOG_FILE"
	apt-get -y install samba										| tee -a        "$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	sleep 5
	echo "Finalizing samba........................................."					| tee -a 	"$LOG_FILE"
	mv -v /etc/samba/smb.conf /etc/samba/smb.conf.bak							| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/samba/smb.conf /etc/samba/smb.conf					| tee -a        "$LOG_FILE"
	mkdir -pv /home/pi							 				| tee -a        "$LOG_FILE"
	chown -Rv root:pi /home/pi/							 			| tee -a        "$LOG_FILE"
	chmod -Rv ug+rwx,o+rx-w /home/pi/							 		| tee -a        "$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	systemctl restart smbd.service							 			| tee -a        "$LOG_FILE"
	#adding pi							 					| tee -a        "$LOG_FILE"
	sleep 3
	clear
	useradd pi -m -G users							 				| tee -a        "$LOG_FILE"
	echo "Pi USER password......." 										| tee -a 	"$LOG_FILE"
	passwd pi							 					| tee -a        "$LOG_FILE"
	echo "Samba password......." 										| tee -a 	"$LOG_FILE"
	smbpasswd -a pi							 					| tee -a        "$LOG_FILE"
	echo "Samba Installed.................."								| tee -a 	"$LOG_FILE"
	testparm												| tee -a 	"$LOG_FILE"
	sleep 5
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	clear
	
	
	## MAKING IP ADDRESS STATIC	
	echo "changing IP address to static XXX.XXX.XX.5"							| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	sleep 5
	mv -v /etc/dhcpcd.conf /etc/dhcpcd.conf.bak								| tee -a        "$LOG_FILE"
	cp -rfv /home/pi/programs/backup/network/dhcpcd.conf /etc/dhcpcd.conf					| tee -a        "$LOG_FILE"
	echo "IP address to static XXX.XXX.XX.5 .................."						| tee -a 	"$LOG_FILE"
	sleep 5
	echo ""													| tee -a 	"$LOG_FILE"
	echo ""													| tee -a 	"$LOG_FILE"
	clear
	
	
	## INSTALLING PIHOLE	
	#echo "Installing PiHole........................"							| tee -a 	"$LOG_FILE"
	#echo "" 												| tee -a 	"$LOG_FILE"
	#sleep 5
	#wget -O basic-install.sh https://install.pi-hole.net							| tee -a 	"$LOG_FILE"
	#chmod +x basic-install.sh										| tee -a 	"$LOG_FILE"
	#./basic-install.sh											| tee -a 	"$LOG_FILE"
	#rm ./basic-install.sh											| tee -a 	"$LOG_FILE"
	#echo "Samba Installed.................."								| tee -a 	"$LOG_FILE"
	#sleep 5
	#echo ""													| tee -a 	"$LOG_FILE"
	#echo ""													| tee -a 	"$LOG_FILE"
	#clear
	
	chmod +x -Rv ./programs											| tee -a 	"$LOG_FILE"
	echo "Congratuation install pi-prerequisites.sh is now installed......." 				| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	date													| tee -a 	"$LOG_FILE"
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
