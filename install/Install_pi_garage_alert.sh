#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/install/Install_pi_garage_alert.sh 
### BEGIN INIT INFO
# Provides:          Install_pi_garage_alert
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Install_pi_garage_alert
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/install/Install_pi_garage_alert.log"

###	CHECKING IF IS BEING RUN AS ROOT
if [ "$(whoami)" != "root" ]; then
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo -e "\e[31mYou have to run this script as Superuser! in order to install Install_pi_garage_alert\e[0m"	| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	exit 0
fi

###	CHECKING IF THE FOLDER EXIST
if [ -f "/usr/local/sbin/pi_garage_alert.pyd" ]; then
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "install Install_pi_garage_alert is already installed......."					| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
exit 0
fi

###	IF FOLDER DOESNT EXIT THEN LETS INSTALL
if [ ! -f "/usr/local/sbin/pi_garage_alert.pyd" ]; then
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a  	"$LOG_FILE"
	echo "# # # # # # #   Starting apt-get Install_pi_garage_alert  # # # # # # # # # # # # # # # # # #"	| tee -a  	"$LOG_FILE"
	date 													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "Installing pre-requisete......." 									| tee -a  	"$LOG_FILE"
	sleep 5
	
	echo	""												| tee -a  	"$LOG_FILE"
	sudo apt-get install python-setuptools python-dev libffi-dev						| tee -a  	"$LOG_FILE"
	easy_install pip											| tee -a  	"$LOG_FILE"
	pip install tweepy											| tee -a  	"$LOG_FILE"
	pip install twilio											| tee -a  	"$LOG_FILE"
	pip install sleekxmpp dnspython pyasn1 pyasn1_modules							| tee -a  	"$LOG_FILE"
	pip install requests											| tee -a  	"$LOG_FILE"
	pip install requests[security]										| tee -a  	"$LOG_FILE"
	apt-get -y install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules			| tee -a  	"$LOG_FILE"
	echo ""													| tee -a  	"$LOG_FILE"
	echo "Downloading pi_garage_alert......." 								| tee -a  	"$LOG_FILE"
	sleep 5
	
	git clone https://github.com/rllynch/pi_garage_alert.git						| tee -a  	"$LOG_FILE"
	
	cp -v /home/pi/programs/backup/pi_garage_alert/bin/pi_garage_alert.py /usr/local/sbin/			| tee -a  	"$LOG_FILE"
	cp -v /home/pi/programs/backup/pi_garage_alert/etc/pi_garage_alert_config.py /usr/local/etc/		| tee -a  	"$LOG_FILE"
	cp -v /home/pi/programs/backup/pi_garage_alert/init.d/pi_garage_alert /etc/init.d/			| tee -a  	"$LOG_FILE"
	chown pi /usr/local/etc/pi_garage_alert_config.py							| tee -a  	"$LOG_FILE"
	cp -v /home/pi/programs/backup/pi_garage_alert/email/sasl_passwd /etc/postfix/				| tee -a  	"$LOG_FILE"
	nano /etc/postfix/sasl_passwd
	cp -v /home/pi/programs/backup/pi_garage_alert/email/main.cf /etc/postfix/				| tee -a  	"$LOG_FILE"
	chown pi /usr/local/sbin/pi_garage_alert.py								| tee -a  	"$LOG_FILE"
	chmod +x /usr/local/sbin/pi_garage_alert.py								| tee -a  	"$LOG_FILE"
	chmod 400 /etc/postfix/sasl_passwd									| tee -a  	"$LOG_FILE"
	postmap /etc/postfix/sasl_passwd									| tee -a  	"$LOG_FILE"
	cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | sudo tee -a /etc/postfix/cacert.pem			| tee -a  	"$LOG_FILE"
	/etc/init.d/postfix reload										| tee -a  	"$LOG_FILE"
	echo "test mail" | mail -s "test subject" 9494603641@txt.att.net					| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo "check your phone for a text....................................." 				| tee -a  	"$LOG_FILE"
	sleep 5
	echo	""												| tee -a  	"$LOG_FILE"
	service pi_garage_alert restart										| tee -a  	"$LOG_FILE"
	service pi_garage_alert status										| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	update-rc.d pi_garage_alert defaults									| tee -a  	"$LOG_FILE"
	rm -R /home/pi/pi_garage_alert										| tee -a  	"$LOG_FILE"
	sleep 5													
	echo "Congratuation install Install_pi_garage_alert is now installed......." 				| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	
	date													| tee -a  	"$LOG_FILE"
	echo "# # # # # # # #        Install_pi_garage_alert DONE!!       # # # # # # # # # # # # # # # # # #"	| tee -a  	"$LOG_FILE"
	echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"
	echo	""												| tee -a  	"$LOG_FILE"

	exit 0
fi








exit 0
