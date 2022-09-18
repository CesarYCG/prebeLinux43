#!/bin/bash

echo "Bienvenido :"

activeSesion=1
user=""

while [ $activeSesion==1 ]
do
	echo "- a) Crear usuario"
	echo "- b) Sugerir contrasena"
	echo "- c) Cambiar contrasena"
	echo "- d) Eliminar usuario"
	echo "- e) Salir"
	read selectedOp

	case $selectedOp in
		a)
		echo "Ingrese el nombre del nuevo usuario: "
		read user
		sudo useradd $user;;
		b)
		sudo apt install pwgen
		newPass=$(pwgen -1)
		echo "Puedes usar la contrasenia: $newPass"
		echo "$newPass" >> "seguras.txt";;
		c)
		echo "Ingresa el usuario: "
		read user
		echo "Ingresa tu contrasena: "
		read pass
		result=$(grep $pass "seguras.txt")
		echo ${#result}
		if [[ ${#result} -ne 0 ]]
		then
			echo -e $pass | sudo passwd $user
		else
			echo "La contrasena no es segura para su uso"
		fi;;
		d)
		echo "Ingrese el nombre del usuario a eliminar: "
		read deletable
		sudo userdel $deletable;;
		e)
		echo "Vuelve pronto."
		exit;;
		*)
		echo "No reconozco la entrada ingresada."
	esac
done
