#!/bin/bash
ls -l /dev/sd*>>usb.txt
egrep "sdb1" usb.txt 2>&1
if [ $? -eq 0 ]; then
	echo 'USB encontrada y funcionando correctamente'
	sudo mkdir /media/usb/
	sudo mount -t vfat /dev/sdb1 /media/usb/
	if [ $? -eq 0 ]; then
		echo "La operacion realizada con exito"
		uname -a>>My_infoLoging.txt&&lslogins -u>>My_infoLoging.txt
		mv My_infoLoging.txt /media/usb/EMI
		sudo umount /dev/sdb1
	else
		echo "No esta el dispositivo conectado o no se pudo montar el dispositivo"
	fi
else
	echo 'algo fallo'
fi
rm usb.txt
sudo rmdir /media/usb
sudo umount /dev/sdb1
chmod 222 usb.sh

