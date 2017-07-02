#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
##	sudo sh /home/pi/programs/update_hass.sh
### BEGIN INIT INFO
# Provides:          update_hass.sh
# Required-Start:    $local_fs 
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: update_hass.sh
### END INIT INFO



sudo systemctl stop home-assistant@homeassistant.service 
sudo su -s /bin/bash homeassistant
echo source /srv/homeassistant/bin/activate
echo "pip3 install --upgrade homeassistant"
exit
sudo systemctl restart home-assistant@homeassistant.service
sleep 10
sudo systemctl status home-assistant@homeassistant.service
sleep 20
sudo systemctl status home-assistant@homeassistant.service




exit 1


added right now
