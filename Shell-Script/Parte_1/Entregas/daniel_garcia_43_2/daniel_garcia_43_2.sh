#!/bin/bash

clear
while :
do
	echo "---MENU---"
	echo "a. Crear nuevo usuario"
	echo "b. Sugerencia de contrasena"
	echo "c. Cambiar contrasena"
	echo "d. Eliminar usuario"
	echo "e. Salir"
	echo "Ingresa tu opcion: "
	read opcion
	case $opcion in
		"a")
			clear
			echo "---Crear nuevo usuario---"
			echo "Ingresa el nombre de usuario: "
			read usuario
			sudo useradd $usuario && sudo passwd $usuario && echo "Se ha creado el usuario con exito"
			;;
		"b")
			clear
			echo "Ya tienes instalado pwgen? "
			echo "1) SI, 2) NO"
			read opcioninst
			if [ $opcioninst -eq 2 ]
			then
				sudo apt-get install pwgen && echo "Ya esta instalado pwgen"
				sleep 2
			fi
			clear
			echo "---Sugerencia de contrasenas---"
			declare -A contrasenas #-A para declarar una variable como arreglo de nombres
			for (( i=1; i<=10; i++ ))
			do
				temp=$(pwgen 8 1)
				contrasenas[$i]=$temp #Para ir guardando una contrasena en el indice i
				echo ${contrasenas[$i]} >> contrasenas.txt #Imprimimos el arreglo uno por uno y guardamos en un archivo txt
				echo ${contrasenas[$i]} #Por alguna razon que desconozco, la linea anterior no imprime la salida del arreglo en la terminal, simplemente repito la accion para que ahora si lo haga xD
			done
			;;
		"c")
			clear
			echo "---Cambio de contrasena---"
			echo "Ingresa tu contrasena: "
			read -s contraIng #Para que no se muestre en terminal
			archivocontra=( `cat "contrasenas.txt" `) #Guardo el archivo txt en un arreglo
			function contiene() { #Es una funcion que nos ayuda a comparar los elementos de un array con un elemento dado
				local n=$#
				local valor=${!n}
				for ((i=1; i< $#; i++)) {
					if [ "${!i}" == "${valor}" ]; then
						echo "y" #Leemos todo el archivo, si se encuentra el valor dado, regresamos una Y y un 0
						return 0
					fi
				}
				echo "n" #Si no se encuentra el elemento dado, regresamos una N y un 1
				return 1
			}
			if [ $(contiene "${archivocontra[@]}" "${contraIng}") == "y" ] #Comparamos el array y el elemento dado, si si se encuentra (o sea que sea igual a Y) procedemos a la sentencia
			then
				echo "Tu contrasena es segura."
				echo "Deseas cambiar la contrasena? 1) Si, 2)No"
				read cambioop
					if [  $cambioop -eq 1 ]
					then
						echo "Ingresa el usuario al que deseas cambiar la contrasena: "
						read usuario2
						sudo passwd $usuario2
					fi
			else
				echo "Tu contrasena no se encuentra dentro de la biblioteca de contrasenas seguras"
			fi
			;;
		"d")
			clear
			echo "---Eliminacion de usuarios---"
			echo "Ingrese el nombre del usuario a eliminar: "
			read nombreus
			sudo deluser $nombreus && echo "El usuario se elimino con exito"
			;;
		"e")
			clear
			echo "Hasta luego"
			exit 0
			;;
		*) echo "Opcion invalida"
	esac
done


