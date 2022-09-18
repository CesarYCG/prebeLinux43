#!/bin/bash

user=$(whoami)

isConnectedUSB=$(lsblk | grep "media/$user" --count)

if [[ $isConnectedUSB -ne "0" ]]
then
	echo "Hay una USB conectada."
	pathUSB=$(lsblk | grep "media/$user")
	pathUSB=${pathUSB:2:5}
	pathUSB="/dev/$pathUSB"

	mountPath="/media/usb-drive"
	sudo mkdir $mountPath
	sudo mount $pathUSB $mountPath

	if [[ $(mount -l | grep $mountPath --count) -ne "0" ]]
	then
		echo "La operacion se realizo con exito."
		logFile="My_infoLoging.txt"
		echo $(uname -a) >> "$mountPath/$logFile"
		echo $user >> "$mountPath/$logFile"
		sudo umount $mountPath
	else
		echo "La operacion no fue realizada con exito"
	fi

	sudo rmdir $mountPath
else
	echo "No hay ninguna USB que se encuentre conectada."
fi
