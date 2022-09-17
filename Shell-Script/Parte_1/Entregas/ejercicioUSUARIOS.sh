#!/bin/bash

salida=5
op=0

while [ "$op" != "$salida" ]

do
echo "¿Que necesitas hacer?"
echo "1)crear un nuevo usuario rapidamente"
echo "2)sugerir contraseña"
echo "3)cambio de contraseña"
echo "4)eliminar usuario"
echo "5)salir"
read op
    case $op in
	1)
        echo "ingrese el nombre de su usuario"
        read nom
        sudo useradd $nom
        passwd $nom
    ;;
    2)
        sudo apt-get install pwgen
        array=$(pwgen 8 -y -s 8)
        for i in "${array[@]}"; do
            echo $i
            echo $i >> contraseñas.txt
        done
    ;;
    3)
        array=$(pwgen 8 -y -s 8)
        echo "$array[@]"
        echo "$array[@]" >> contraseñasSeguras.txt
        echo "el nombre de la cuenta  a la que le cambiara el nombre"
        echo "seguro del cambio de contraseña"
        echo "1 = si   0 = no"
        read siu
        no=0
        if [[ $siu -eq $no ]]; then 
            echo "ingrese una de las contraseñas generadas"
            passwd $nom
        fi
    ;;
    4)
        echo "ingrese el usuario a eliminar"
        read dead
        sudo userdel $dead
        echo "usuario exterminado"
    ;;
    esac
done