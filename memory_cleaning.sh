#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/memory_cleaning.sh 
### BEGIN INIT INFO
# Provides:          memory_cleaning
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: memory_cleaning
### END INIT INFO

mkdir -p /home/pi/log/install
LOG_FILE="/home/pi/log/memory_cleaning.log"


if [ "$(whoami)" != "root" ]
then
  echo "You have to run this script as Superuser!"
  exit 1
fi

echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	    																| tee -a 	"$LOG_FILE"
echo "# # # # # # # # Starting apt-get-memory_cleaning  # # # # # # # # # # # # # #"	   																	| tee -a 	"$LOG_FILE"
date 																																						| tee -a 	"$LOG_FILE"



# Get Memory Information
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)						| tee -a 	"$LOG_FILE"
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)				| tee -a 	"$LOG_FILE"

# Output Information
#echo -e "This script will clear cached memory and free up your ram.\n\nAt the moment you have $cachedmem_before MiB cached and $freemem_before MiB free memory."

# Test sync
if [ "$?" != "0" ]
then
  echo "Something went wrong, It's impossible to sync the filesystem."
  exit 1
fi

# Clear Filesystem Buffer using "sync" and Clear Caches	
sync && echo 3 > /proc/sys/vm/drop_caches																													| tee -a 	"$LOG_FILE"
sudo sysctl -w vm.drop_caches=3																																| tee -a 	"$LOG_FILE"
sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches																										| tee -a 	"$LOG_FILE"

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)						| tee -a 	"$LOG_FILE"

# Output Summary
echo -e "This freed $(echo "$freemem_after - $freemem_before" | bc) MiB, so now you have $freemem_after MiB of free RAM."

echo																																						| tee -a 	"$LOG_FILE"
date																																						| tee -a 	"$LOG_FILE"
echo "# # # # # # # #        memory_cleaning DONE!!       # # # # # # # # # # # # #"	       																| tee -a 	"$LOG_FILE"
echo "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #"	       																| tee -a 	"$LOG_FILE"
echo																																						 | tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"
echo																																						| tee -a 	"$LOG_FILE"


exit 0
