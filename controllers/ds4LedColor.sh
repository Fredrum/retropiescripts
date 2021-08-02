#!/usr/bin/env bash

# Setting the DS4 led color to green

#this line does not work as a udev script
#echo "did" > ~/did.txt

# look for "KERNELS=" might give you the long number 
# udevadm info --attribute-walk --name /dev/input/js0

# reload udev rule  sudo udevadm control --reload-rules
# sudo udevadm trigger (maybe not needed)
# test with   /devices/platform/soc/fe201000.serial/tty/ttyAMA0/hci0/hci0:12/0005:054C:05C4.0007/input/input13


#echo 128 | sudo tee /sys/class/leds/0003:054C:05C4.0014:green/brightness
#or
#echo 1 | sudo tee /sys/class/leds/*:green/brightness

echo 0 | sudo tee /sys/class/leds/*:red/brightness
echo 74 | sudo tee /sys/class/leds/*:green/brightness
echo 0 | sudo tee /sys/class/leds/*:blue/brightness
