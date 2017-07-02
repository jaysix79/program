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
	echo "You are Running the pi-prerequisites.sh script."							| tee -a 	"$LOG_FILE"
	echo "This script is best to run right after a fresh Pi Installation" 					| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	echo "Now this will clean and update the system"							| tee -a 	"$LOG_FILE"
	echo "" 												| tee -a 	"$LOG_FILE"
	
	##	Cleaning and Updating INSTALLATION
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
	#		/home/pi/programs/install/Initial_Pi_Update.sh 						| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully Cleaned and Updated"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this sync with Github"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped Cleaning and Updating"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this Now this sync with Github"						| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	
	esac
	
	
	##	sYNCING WITH GITHUB
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			echo "Yes"
			/home/pi/programs/git_clone.sh								| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully cleaned and updated the system"					| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this will set IP address to 192.168.xxx.5"					| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped Syncing with GitHub"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this will set IP address to 192.168.xxx.5"					| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	esac
	
	##	SETTING UP IP
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			/home/pi/programs/static_ip.sh 							| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully changed IP address  to 192.168.xxx.5"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this install SAMBA file sharing over the network "				| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped static IP address"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now  his install SAMBA file sharing over the network "				| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	esac
	
	
	##	SAMBA INSTALLATION
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
			/home/pi/programs/install/Install_samba.sh 						| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully Installed SAMBA"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this install Garage Notification for Pi using GPIO "				| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped SAMBA installation"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this install Garage Notification for Pi using GPIO "				| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	
	esac
	
	
	##	Garage Notification for Pi using GPIO INSTALLATION
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
	#		/home/pi/programs/install/Install_pi_garage_alert.sh 						| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully Installed Garage Notification for Pi using GPIO"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this install SIP open sprinkler for Pi"					| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped Garage Notification for Pi using GPIO installation"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "Now this install SIP open sprinkler for Pi"					| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	
	esac
	
	
	##	INSTALLING SIP open sprinkler for Pi
	read -r -p "Are You Sure you want to continue? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
	#		/home/pi/programs/install/Install_sip_sprinkler.sh 						| tee -a 	"$LOG_FILE"
			clear
			echo "Successfully Installed SIP open sprinkler for Pi"							| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			#echo "This install SAMBA file sharing over the network "				| tee -a 	"$LOG_FILE"
			#echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    [nN][oO]|[nN])
			clear
			echo "Skipped SIP open sprinkler for Pi installation"
			echo "" 										| tee -a 	"$LOG_FILE"
			echo "" 										| tee -a 	"$LOG_FILE"
			##
			#echo "" 										| tee -a 	"$LOG_FILE"
			#echo "" 										| tee -a 	"$LOG_FILE"
			;;

	    *)
		clear
		echo "Invalid input..."
		#exit 1
		;;
	esac







	
	echo "Please reboot your computer for the change to take effect!!!"					| tee -a 	"$LOG_FILE"
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
