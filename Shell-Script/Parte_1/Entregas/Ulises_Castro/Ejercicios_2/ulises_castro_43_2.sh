# /bin/bash
op="0"
pwsd=()
while [ "$op" != 5 ]
do
	echo "Dame una opcion"
	echo "1) Agregar usuario"
	echo "2) Sugerencia de contraseña"
	echo "3) Cambio de contraseña"
	echo "4) Eliminacion de usuario"
	echo "5) Salir"
	read op
	case $op in 
		1)
			echo "Ingrese un usuario"
			read nombre
			sudo adduser $nombre
			;;
		2)	
			pwsd=("${pwsd[@]}" "$(pwgen -1 9)") || (sudo apt install pwgen && pwsd=("${pwsd[@]}" "$(pwgen -1 9)"))
			for i in "${pwsd[@]}"
			do	
		   	 	echo "$i"
			done
			;;
		3)
			echo "Selecciona una de las contraseñas generadas"
			for i in "${pwsd[@]}"
			do
				echo "$i"
			done
			read -s contra
			for i in "${pwsd[@]}"
			do
				if [[ $i -eq $contra ]]
				then
					 sudo passwd
				else
					echo "No esta mi pana :("
				fi
			done
			;;
		4)
			echo "dame el nombre del usuario que desaparecerá: "
			read us
			sudo userdel -r $us
			;;
		5)
			echo "Saliste pa"
			;;
		*)
			echo "Ponme una opcion valida wey xD"
			;;
	esac
done
