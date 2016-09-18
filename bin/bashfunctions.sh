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
			xrandr --output VGA1 --auto
			xrandr --output LVDS1 --off
			;;
		"on on")
			xrandr --output LVDS1 --off
			;;
	esac
}

bdon(){
	# both displays on
	orientation=$(cat ~/.config/displayOrientation)
	case $(dstatus) in 
		"on off" | "off on")
		xrandr --output LVDS1 --auto 
		xrandr --output VGA1 --auto --${orientation}-of LVDS1
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
			xrandr --output VGA1 --off 
			;;
		"off on")
			xrandr --output LVDS1 --auto --output VGA1 --off
			;;
	esac
}

dstatus(){
	#echoes status of laptop display and external display as on or off or disconnected (only external display)
	status="beforeL"
	ld="off" ; ed="disconnected"
	xrandr | {
	while read line ; do
		case $status in 
			"beforeL")
				[[ $line == *"LVDS1"* ]] && status="inL"
				;;
			"inL")
				[[ $line == *"disconnected"* ]] && status="afterL"
				[[ $line == *"*"* ]] && ld="on"
				;;
			"afterL")
				[[ $line == *"VGA1 connected"* ]] && status="inE" && ed="off"
				;;
			"inE")
				[[ $line == *"*"* ]] && status="over" && ed="on" 
				;;
		esac
	done
	echo "$ld $ed"
	}
}

dtoggle(){
	#toggles the status of laptop and external display
	case $(dstatus) in 
		"on disconnected")
			echo "Error: External display is disconnected"
			;;
		"on off")
			orientation=$(cat ~/.config/displayOrientation)
			xrandr --output VGA1 --auto --${orientation}-of LVDS1
			;;
		"on on")
			xrandr --output LVDS1 --off
			;;
		"off on" | "off disconnected")
			xrandr --output LVDS1 --auto
			xrandr --output VGA1 --off
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
	xrandr --output VGA1 --mode 1024x768 --output LVDS1 --mode 1024x768
}

aurclone(){
	git clone https://aur.archlinux.org/${1}.git
}
