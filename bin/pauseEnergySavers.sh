#!/bin/bash

sigintHandler(){
	xautolock -time 10 -locker "/usr/local/bin/i3lock2" &
	xfce4-power-manager &
	xset s on
	xset +dpms
	echo "done"
	exit 0
}


trap sigintHandler SIGINT ;

#check arguments
if [[ $1 != [0-9]* ]] ; then
       	echo -e "argument is not a valid number\nexiting" 
	exit 1
fi


killall xautolock 
killall xfce4-power-manager
xset s off
xset -dpms

declare -i timeremaining=$1

while [[ $timeremaining -gt 0 ]] ; do
	echo "$timeremaining minutes remaining"
	((timeremaining--))
	sleep 1m
done

sigintHandler
