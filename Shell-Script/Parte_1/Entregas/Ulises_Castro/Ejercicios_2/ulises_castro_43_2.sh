# /bin/bash
op="0"
while [ "$op" != 5 ]
do
	echo "Dame una opcion"
	echo "1) Agregar usuario"
	echo "2) Sugerencia de contraseña"
	echo "3) Cambio de contraseña"
	echo "4) Eliminacion de usuario"
	echo "5) Salir"
	read op
	pwsd=()
	case $op in 
		1) echo "Ingrese un usuario"
		read nombre
		sudo adduser $nombre
		;;
		2) pwsd=("${pwsd[@]}" "$(pwgen -1 9)")
		for i in "${pwsd[@]}"
		do
		    echo "$i"
		done
done
