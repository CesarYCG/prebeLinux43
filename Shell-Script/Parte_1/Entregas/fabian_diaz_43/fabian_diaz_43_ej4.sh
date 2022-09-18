#!/bin/bash

n=$(whoami)
m=$(ls "/media/$n/")
t=${#m}

if [[ t -gt 0  ]] && [[ -e "/dev/sdb1" ]]; then
	echo "La operacion se realizo con exito."
	uname -a > 'My infoLoging'.txt
	lsusb >> 'My infoLoging'.txt
	who -H >> 'My infoLoging'.txt

	umount /dev/sdb1
else
	echo "No esta el dispositivo conectado o no se pudo montar."
	uname -a > 'My infoLoging'.txt
	lsusb >> 'My infoLoging'.txt
	who -H >> 'My infoLoging'.txt
fi

chmod -x fabian_diaz_43_ej4.sh
