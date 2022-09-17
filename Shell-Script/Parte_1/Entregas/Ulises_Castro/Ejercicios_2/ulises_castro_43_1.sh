#! /bin/bash

mkdir /media/USB
mount -t -vfat /dev/sdb1 /media/usb && cumple=1

if [[ $cumple -eq 1 ]]
then
	echo "Montaje realizado con exito"
	echo "Escribe cualquier cosa para desmontar la USB"
	read xD
	umount /media/USB

else 
	echo "No se pudo realizar el montaje :("
	neofetch >> MyinfoLoging.txt
	echo "Informacion del usuario\n" >> MyinfoLoging.txt
	id >> MyinfoLoging.txt
fi



chmod 444 ulises_castro_43_1.sh

echo "Terminado"
