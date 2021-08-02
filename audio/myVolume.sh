#!/usr/bin/env bash

#  Change ALSA volume for currently engaged device
#

mode=$1
echo $mode 

currentVolume=`amixer cget numid=2 | grep ": values" | cut -d"," -f 2`
echo $currentVolume

dialogCmd=(dialog --rangebox "Set Volume" 2 127 1 127 $currentVolume)
newVolume=$("${dialogCmd[@]}" 2>&1 >/dev/tty)


echo "New Volume:  $newVolume"
amixer cset numid=2 $newVolume
