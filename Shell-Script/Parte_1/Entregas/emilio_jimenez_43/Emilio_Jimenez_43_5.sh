#!/bin/bash

echo "Digitie un numero para la opcion"
echo "1) Crear un nuevo usuario"
echo "2) Sugerencia de contraseña"
echo "3) Cambio de contraseña"
echo "4) Eliminacion de usuario"
echo "5) salir"
read op

case $op in

	1) #Crea nuevo usuario
                echo "Dame tu usuario"
		read u
		sudo adduser $u
		sudo passwd $u
                ;;
        2) #Sugiere contraseña
		which pwgen>>salida.txt 2>&1
		if [ $? -eq 0 ]; then
		for i in {1..10}
		do
  			pw=$(pwgen -s -1 9)
        		echo "$pw">>contra.txt 
		done
		declare -a con
		i=0
		while IFS= read -r linea
		do
		con[$i]="$linea"
		((i++))
		done < contra.txt
		for i in "${con[@]}"
		do
			echo $i
		done
		else
            	sudo dnf makecache --refresh
		sudo dnf -y install pwgen
		fi
		rm -r salida.txt
                ;;
	3) #Cambia contraseña
		for i in {1..10}
                do
                        pw=$(pwgen -s -1 9)
                        echo "$pw">>secure.txt
                done
		echo "Dame el usuario"
		read us
		echo "Dame tu contraseña segura"
		read -s seg
		echo "Cual es tu contraseña actual"
		read act
		buscar(){
    		while IFS= read -r line
    		do
			"$seg"="$line"
        		if [ $? -eq 0 ];
        		then
             			echo "Cambiando contraseña"
				sleep 3
				sudo passwd $us
				$act
				$seg
				$seg
				rm -r salida.txt
				rm -r secure.txt
				exit
			else
				echo "Tu contraseña no es segura"
				sleep 3
				rm -r salida.txt
				rm -r secure.txt
				exit
        		fi
   		 done < secure.txt
		}
		buscar "$seg"
		;;
	4) #Eliminacion de usuario
		echo "Dame el nombre del usuario que deseas eliminar"
		read usu
		sudo userdel -r $usu
                ;;
	5) #Salir
		echo "Hasta luego"
                ;;
        *) #cualquier otra cosa
                echo "no entendi eso"
                ;;
esac

rm -r contra.txt
rm -r secure.txt
