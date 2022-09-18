#!/bin/bash
opc=0
salida=4
while [ "$opc" != "$salida" ]
do
echo "Que deseas hacer?"
echo "1)Crear usuario"
echo "2)Sugerencia de contraseñas"
echo "3)Eliminar usuario"
echo "4)Salir"
	read opc
	case $opc in
		1)
		echo "Ingresa el nombre del usuario"
		read nom
		sudo useradd $nom
		sudo passwd $nom
		;;
		2)
		echo "Tienes instalado pwgen?"
	        echo "1=Si"
        	echo "0=No"
		read ins
        	var=1
		if [[ $ins -eq $var ]]
       		then
            		echo "Estas son tus contraseñas: "
		    	for ((i=1; i<=8; i++))
            		do
	        	arre=$(pwgen)
	        	echo "$arre"
                	echo "$arre" >> contrasenas.txt
            	done
        	else
            		sudo apt install pwgen
            		echo "Estas son tus contraseñas: "
		    	for ((i=1; i<=8; i++))
            		do
	            		arre=$(pwgen)
	            		echo "$arre"
                		echo "$arre" >> contrasenas.txt
            	done
        	fi
		;;

		3)
		echo "Que usuario deseas eliminar?"
		read borrar
		sudo userdel $borrar
		echo "Usuario eliminado"
		;;
	esac
done
