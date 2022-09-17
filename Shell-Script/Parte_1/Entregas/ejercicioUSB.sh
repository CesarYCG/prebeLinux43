#!/bin/bash

salida=3
op=0

while [ "$op" != "$salida" ]

do
echo "¿Que necesitas hacer?"
echo "1)verifica el montaje de la memomoria"
echo "2)expulsar la memoria"
echo "3)salir"
read op
	case $op in
	1)
		sudo mount /dev/sdb1 /media/ianlg/
		montaje=$(ls -a "/media/ianlg/")
		if [[ ! -z "$montaje" ]]; then
			echo "el montaje se realizo con exito"
			echo "$date USB lista para usar" >> MyInfoLoging.txt
		else
			echo "El dispositivo no esta conectado o no se puede leer"
			echo "$date USB no esta en condiciones de usarse" >> MyInfoLoging.txt
		fi
		;;
	2)
		udisksctl unmount --force -b /dev/sdb1
		;;
	esac
done
chmod -wx ./EjercicioUSB.sh