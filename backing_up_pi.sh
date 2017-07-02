#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	 sudo sh /home/pi/programs/backing_up_pi.sh 
### BEGIN INIT INFO
# Provides:          backup_pi_garage_alert
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: backup_pi_garage_alert
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/backing_up_pi.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]
then
	echo "You have to run this script as Superuser! in order to run backing_up_pi.sh "
	exit 1
fi

	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #          Starting backing_up_pi.sh      # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	date 																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"

	chmod -R -v 777 /home/pi/backup/																		| tee -a 	"$LOG_FILE"
	chmod -R -v 777 /home/pi/log/																			| tee -a 	"$LOG_FILE"
	
	mkdir -p /home/pi/backup/pi_garage_alert/bin/															| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/pi_garage_alert/etc/ 															| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/pi_garage_alert/init.d/ 														| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/pi_garage_alert/email/ 														| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/samba/ 																		| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/network/																		| tee -a 	"$LOG_FILE"
	mkdir -p /home/pi/backup/email/																			| tee -a 	"$LOG_FILE"
	#mkdir -p /home/pi/backup/ 																				| tee -a 	"$LOG_FILE"
	#mkdir -p /home/pi/backup/ 																				| tee -a 	"$LOG_FILE"
	#mkdir -p /home/pi/backup/ 																				| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	sudo tar -zcf /home/pi/backup/PiHome$(date +%H%M-%d-%m-%Y).tgz /home/ --exclude='*.tgz'					| tee -a 	"$LOG_FILE"
	
	## BACKUP GARAGE SETTINGS
	rsync -av /usr/local/sbin/pi_garage_alert.py /home/pi/backup/pi_garage_alert/bin/      					| tee -a 	"$LOG_FILE"
	rsync -av /usr/local/etc/pi_garage_alert_config.py /home/pi/backup/pi_garage_alert/etc/ 				| tee -a 	"$LOG_FILE"
	rsync -av /etc/init.d/pi_garage_alert /home/pi/backup/pi_garage_alert/init.d/ 							| tee -a 	"$LOG_FILE"
	rsync -av /etc/postfix/main.cf /home/pi/backup/pi_garage_alert/email/									| tee -a 	"$LOG_FILE"
	rsync -av /etc/postfix/sasl_passwd /home/pi/backup/pi_garage_alert/email/								| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	
	
	## BACKUP MAIL (postfix)
	rsync -av /etc/postfix/main.cf /home/pi/backup/email/													| tee -a 	"$LOG_FILE"
	rsync -av /etc/postfix/sasl_passwd /home/pi/backup/email/												| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	
	## BACK UP SAMBA
	rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	
	## STATIC IP
	rsync -av /etc/network/interfaces /home/pi/backup/network/												| tee -a 	"$LOG_FILE"
	rsync -av /etc/dhcpcd.conf /home/pi/backup/network/														| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -av /etc/samba/smb.conf /home/pi/backup/samba/													| tee -a 	"$LOG_FILE"
	#rsync -avh /home/pi/backup/ john@192.168.79.8:/DELLSERVER/Programs/PiBackup/							| tee -a 	"$LOG_FILE"
	
	chmod -R -v 777 /home/pi/backup/																		| tee -a 	"$LOG_FILE"
	chmod -R -v 777 /home/pi/log/																			| tee -a 	"$LOG_FILE"
	
	echo																									| tee -a 	"$LOG_FILE"
	date																									| tee -a 	"$LOG_FILE"
	echo "# # # # # # # #        /home/pi/programs/backing_up_pi DONE!!       # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"
	echo																									| tee -a 	"$LOG_FILE"



exit 1