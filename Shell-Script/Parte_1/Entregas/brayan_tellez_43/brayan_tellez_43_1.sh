#!/bin/bash

echo "Bienvenido, esta aplicacion de terminal te ayudara a crear alias con funciones :)"

echo "Ingresa el alias a usar: "
read aliasName

echo "Ingresa el comando a ejecutar: "
read command

createdAlias="alias '$aliasName'='$command'"
echo "El alias a crear es: $createdAlias"
echo -n "Confirmar [Y/n]"
read confirm

if [ $confirm == "Y" ]
then
	(echo $createdAlias >> alias.txt || (echo "# Este es un texto con alias" > alias.txt && echo $createdAlias >> alias.txt)) && echo "Se guardo el archivo: " && cat alias.txt
fi
