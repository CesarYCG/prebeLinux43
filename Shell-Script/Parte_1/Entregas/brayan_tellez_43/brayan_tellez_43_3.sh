#!/bin/bash

clear

DIRECTORY_NAME="encontrado"
FILE_NAME="route_find.txt"

echo "Cual es la ruta en la que se va a buscar? "
read route

echo "Cual es la extension del archivo? "
read extFile

fileFound=$(ls $route | grep $extFile )

if [ ${#fileFound[@]} -eq 0 ]
then
	echo "No se encontraron coincidencias"
else
	echo "Creando fichero y tambien copia del archivo encontrado"
	mkdir $DIRECTORY_NAME && pwd && echo $fileFound > "./$DIRECTORY_NAME/$FILE_NAME"
	for file in $fileFound
	do
		sleep 3
		cp "$route$file" "$DIRECTORY_NAME/" && echo "--- Archivo copiado: "
		cat "$DIRECTORY_NAME/$file"
	done

	tree "./$DIRECTORY_NAME"
	sleep 6 && rm -r "$DIRECTORY_NAME" && clear
fi
