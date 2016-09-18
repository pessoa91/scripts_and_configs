
power_manager_config=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml

old_timeout=30
new_timeout=300

changeTimeout(){
	sed -i "s/value=\"$1\"/value=\"$2\"/" $power_manager_config
	killall xfce4-power-manager
	xfce4-power-manager &
}

sigintHandler(){
	changeTimeout $new_timeout $old_timeout
	exit
}

trap sigintHandler SIGINT

changeTimeout $old_timeout $new_timeout

while [[ $(playerctl -p spotify status) == "Playing" ]] ; do
	sleep 10m
done

sigintHandler
