#!/bin/bash
clear

FILE_NAME=Death_script.txt

username=$(whoami)
echo "Hola $username, bienvenido de nuevo!!!"

names=()
otherRegister="Y"
i=0

if [[ ! -e $FILE_NAME ]]
then
	echo "---- THIS IS A DEATHNOTE ----" > $FILE_NAME
fi

while [ "$otherRegister" == "Y" ]
do
	echo "Ingresa el nombre de la victima: "
	read names[i]

	echo "Quieres registrar otro nombre? [Y/n]: "
	read otherRegister

	echo ${names[$i]}>>$FILE_NAME

	i=$(($i+1))
done

echo "Los nombres de las victimas de hoy son: "
for (( j=0; j<$i;j++ ))
do
	echo "[$(($j+1))] : ${names[j]}"
done
