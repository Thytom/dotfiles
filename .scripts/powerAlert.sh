#!/bin/bash

# Alerts the user at certain power percentages

# Grabs the battery percentage

#Get DBUS working
#DBUS=$(/bin/ps aux | /bin/egrep "/gnome-session/.*\s--session=" | /usr/bin/awk '{print $2}')
# export $(/bin/cat /home/archie/.dbus/session-bus/* | /bin/egrep DBUS_SESSION_BUS_ADDRESS | /usr/bin/awk '{print $2}')
export DISPLAY=:0

currentPercentage=$(/bin/cat /sys/class/power_supply/BAT0/capacity)
lastAlert=$(/bin/cat /home/archie/.config/powerAlert/lastAlert)

urgentTitle='OH GOD OH FUCK'
urgentMessage="Battery critically low. Plug in quick."

lowTitle='Battery Low'
lowMessage='Charge when possible.'

fullTitle='Battery Full'
fullMessage=''

# DEBUG -- echo $currentPercentage $lastAlert#
# DEBUG -- /usr/bin/notify-send Test Yey

batStatus=$(/bin/cat /sys/class/power_supply/BAT0/status)

if (( batStatus = "Charging" ))
then
    exit 0
fi

if (( $currentPercentage < 11 )) && (( $lastAlert > 10 ))
then
	/usr/bin/notify-send --urgency=critical "$urgentTitle" "$urgentMessage"
elif (( $currentPercentage < 26 )) && (( $lastAlert > 25 ))
then
	/usr/bin/notify-send --urgency=normal "$lowTitle" "$lowMessage"
elif (( $currentPercentage > 95 )) && (( $lastAlert < 95 ))
then
	/usr/bin/notify-send --urgency=normal "$fullTitle" "$fullMessage"
fi

echo $currentPercentage > /home/archie/.config/powerAlert/lastAlert
