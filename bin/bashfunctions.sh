VGA='DP2'
LVDS='LVDS1'

null(){
	echo "$@"
	$@ &> /dev/null &
}

unmnt(){
	killall spotify && sleep 2s
	umount "LABEL=shared2" && echo success
}

mnt(){
	mount -t ntfs -o defaults,user,rw,umask=000 "LABEL=shared2" /mnt/shared
}


ldoff(){
	# laptop display off
	case $(dstatus) in 
		"on disconnected")
			echo "Error: no External display" 
			;;
		"on off")
			xrandr --output $VGA --auto
			xrandr --output $LVDS --off
			;;
		"on on")
			xrandr --output $LVDS --off
			;;
	esac
}

bdon(){
	# both displays on
	orientation=$(cat ~/.config/displayOrientation)
	case $(dstatus) in 
		"on off" | "off on")
		xrandr --output $LVDS --auto 
		xrandr --output $VGA --auto --${orientation}-of $LVDS
		;;
	esac
}

edoff(){
	# external display off
	case $(dstatus) in 
		"on disconnected" | "on off") 
			return 
			;;
		"on on")
			xrandr --output $VGA --off 
			;;
		"off on")
			xrandr --output $LVDS --auto 
			sleep 0.1s
			xrandr --output $VGA --off
			;;
	esac
}

dstatus(){
	#echoes status of laptop display and external display as on or off or disconnected (only external display)
	status="beforeL"
	ld="off" ; ed="disconnected"
	while read line ; do
		case $status in 
			"beforeL")
				[[ "$line" == "$LVDS"* ]] && status="inL"
				;;
			"inL")
				[[ "$line" == *"*"* ]] && ld="on"
				[[ "$line" == "$VGA connected"* ]] && status="inE" && ed="off"
				[[ "$line" == "$VGA disconnected"* ]] && break
				;;
			"inE")
				[[ "$line" == *"*"* ]] && ed="on" && break
				;;
		esac
	done <<< $(xrandr)
	echo "$ld $ed"
}

dtoggle(){
	#toggles the status of laptop and external display
	case $(dstatus) in 
		"on disconnected")
			echo "Error: External display is disconnected"
			;;
		"on off")
			orientation=$(cat ~/.config/displayOrientation)
			xrandr --output $VGA --auto --${orientation}-of $LVDS
			;;
		"on on")
			xrandr --output $LVDS --off
			;;
		"off on" | "off disconnected")
			xrandr --output $LVDS --auto
			sleep 0.1s
			xrandr --output $VGA --off
			;;
	esac
}

changeOrientation(){
	file=~/.config/displayOrientation
	case $1 in 
		"l")
			echo "left" > $file ;;
		"r")
			echo "right" > $file ;;
		*)
			echo "error: use l or r only" ;;
	esac
}

svim(){
	if [[ $1 == "l" ]] ; then
		ls ~/.vim/sessions
	else
		gvim -S ~/.vim/sessions/$1
	fi
}

presentationDisplayMode(){
	xrandr --output $VGA --mode 1024x768 --output $LVDS --mode 1024x768
}

aurclone(){
	git clone https://aur.archlinux.org/${1}.git
}
