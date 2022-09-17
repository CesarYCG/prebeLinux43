#!/bin/bash
opc=0
salida=3
while [ "$opc" != "$salida" ]
do
echo "Que deseas hacer?"
echo "1)Verificar el estado de la memoria"
echo "2)Expulsar memoria"
echo "3)Salir"
	read opc
	case $opc in
		1)
		USB=$(ls -A '/media/chilpalan/') 
		if [[ ! -z "$USB" ]]; then 
			echo "La operación se realizó con éxito"
		else
			echo "No está el dispositivo conectado o no se pudo montar el dispositivo"
	   	fi
	    	;;
        2)
	    	sudo eject /dev/sdb1

		;;
	esac
done
lscpu>My_infoLoging.txt && finger>>My_infoLoging.txt
chmod -wx ./Ejercicio1.sh
