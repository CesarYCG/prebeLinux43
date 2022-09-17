#!/bin/bash

echo "a. Crear un nuevo usuario (Rapidamente)."
echo "b. Sugerencia de contraseña."
echo "c. Cambio de contraseña."
echo "d. Eliminacion de usuario."
echo "e. Salir."

o="z"
nombres=()
n=0
cont=()
j=0
while true ; do

	echo -n "Seleccione una opcion: "
	read o

	case $o in
		'a') echo -n "Digite el nombre de usuario: "
		     read nombres[n]
		     sudo useradd -m ${nombres[n]}
		     sudo passwd ${nombres[n]}
		     n=$((n+1))
	    	    ;;
		'b') which pwgen || sudo apt-get -y install pwgen
		     for (( j=0; j<10; j++ ))
		     do
		     	cont[i]=$(pwgen -N 1)
			echo ${cont[i]}
		     done
		    ;;
		'c') if [[ j -ne 10 ]] ; then
		     	for (( j=0; j<10; j++))
			do
		        	cont[i]=$(pwgen -N 1)
				echo ${cont[i]}
			done
		     fi
		     echo -n "Teclee una contraseña de la lista: "
		     read -s c
		     for (( j=0; j<10; j++ ))
		     do
			if [[ ${cont[j]} -eq ${c[@]} ]] ; then
				echo "La contraseña coincide con una generada"
				break
			fi
		     done
		     echo " "
		     echo "${nombres[((n-1))]}:${c}" > c
		     sudo chpasswd < c
		     rm c
		    ;;
		'd') for (( i=0; i<$n; i++ ))
		     do
		     	echo -n "$i. "
			echo ${nombres[i]}
		     done
		     echo -n "Digite el numero del usuario a eliminar: "
		     read nomdel
		     sudo userdel -r ${nombres[nomdel]}
		     nombres[nomdel]=" "
		    ;;
		'e') break
		    ;;
		*) echo "Aios"
		  ;;
	esac
done
