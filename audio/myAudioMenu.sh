#!/usr/bin/env bash

#  Script to change audio out device on a RPi4.
#  Tested on RPi4, Buster 32bit, Kernel 5.4, ALSA only.
#  Not tested with HDMI2. Works with Apple AirPods (Bluetooth).

function gui() {
	
	local options=(
        1 "HDMI 1"
        2 "Jack on Raspberry"
        3 "AirPods"
	4 "Cardboard Receiver"
    )
	
	dialogCmd=(dialog --menu "Choose Audio output" 22 100 16)
	choice=$("${dialogCmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	
	if [[ -n "$choice" ]]; then
	case "$choice" in
		1)
			echo "HDMI 1"
			rm -f ~/.asoundrc
			ln -s ~/.asoundrc_hdmi ~/.asoundrc
			;;
		2)
			echo "Jack on Pi"
			rm -f ~/.asoundrc
			ln -s ~/.asoundrc_pijack ~/.asoundrc
			;;
		3)
			echo "airpods"
			rm -f ~/.asoundrc
			ln -s ~/.asoundrc_airpods ~/.asoundrc
			bluetoothctl connect AC:1D:06:07:9F:01
			;;
		4)
			echo "cardboard receiver"
			rm -f ~/.asoundrc
			ln -s ~/.asoundrc_xy ~/.asoundrc
			bluetoothctl connect A0:27:26:49:37:83
			;;
        esac
    fi

}

# run this script
gui
