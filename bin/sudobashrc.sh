tudvpn(){
	sudo openconnect vpn.hrz.tu-darmstadt.de
}

backupUsb(){
	[[ -z $1 ]] && echo -e "no arg given\nusage: backupUsb sdxN" && return -1

	devpoint=/dev/$1
	data_loc=/mnt/shared/daten
	doc_loc=/mnt/sec/dokumente
	ext=/mnt/usb

	[[ ! -e $devpoint ]] && echo "mountpoint does not exit, exit" && return -2
	
	umount $devpoint || echo "Unmounting not possible"

	mount $devpoint $ext

	if [[ ! $? ]] ; then
		echo "Mounting failed"
		return -4
	fi
	
	echo "copying $loc/daten..."
	tar -vPuf $ext/daten.tar $data_loc
	echo "copying $loc/dokumente..."
	tar -vPuf $ext/dokumente.tar $doc_loc
	echo "Copy process finished :)"

	sync
	echo "Sync process finished :)"
	
	sudo umount $devpoint && echo "device unmounted" || echo "unmounting of /dev/$1 failed"
}

listips(){
	arp-scan --interface=wlp3s0 --localnet
}

