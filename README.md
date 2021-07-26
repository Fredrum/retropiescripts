# retropiescripts

Reinstall Retropie 4.7.1
Connecting DS4 through Retropie -> Works!

1. sudo apt install bluealsa
export LIBASOUND_THREAD_SAFE=0
/usr/bin/bluealsa -S &
/usr/bin/bluealsa: Couldn't acquire D-Bus name: org.bluealsa
STILL WORKS
sudo adduser pi bluetooth
sudo nano /etc/systemd/system/bluetooth.target.wants/bluetooth.service
sudo systemctl daemon-reload
systemctl restart bluetooth
NOW BROKEN
