#!/bin/bash

usuario=$(whoami)
conexion=$(cd /media/$usuario/)

if [[ $(find /media/$usuario/*) ]]
then
	echo "La USB si esta conectada"
	sudo mkdir /media/usb-drive
	sudo mount /dev/sda1 /media/usb-drive && echo "La operacion se realizo con exito"
	if [[ $(find /media/usb-drive) ]]
	then
		cd /media/usb-drive && touch MyinfoLoging.txt
		lscpu > MyinfoLoging.txt && uname -a >> MyinfoLoging.txt && who -H >> MyinfoLoging.txt
		sudo chmod +r-wx MyinfoLoging.txt
		cd ~
	fi
else
	echo "No se ha detectado el dispositivo o no se puede montar el dispositivo"
fi
sleep 5
sudo umount /media/usb-drive
sleep 1
sudo eject /dev/sda1
