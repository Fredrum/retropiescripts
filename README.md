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
sudo nano /etc/systemd/system/bluetooth.target.wants/bluetooth.service
sudo systemctl daemon-reload
systemctl restart bluetooth
WORKS
--plugin=a2dp
sudo systemctl daemon-reload
systemctl restart bluetooth
BREAKS
--noplugin=sap 
WORKS when NOT also using --plugin=a2dp

BUT

Keeping only
ExecStart=/usr/lib/bluetooth/bluetoothd --noplugin=sap
then manually in a shell doing
kill bluetoothd
sudo bluetoothd -P sap -n
Actually got both DS4 and AirPods to connect.  (They were already registered and paired)

