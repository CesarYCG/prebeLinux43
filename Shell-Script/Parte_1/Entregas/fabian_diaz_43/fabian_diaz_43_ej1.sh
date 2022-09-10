#!/bin/bash

echo -n "Ingrese un nombre para un alias: "
read a

echo -n "Ingrese el comando o comandos funcion del alias: "
read f

echo "alias '$a' = '$f'" >> alias.txt

echo "Comando creado: "
echo "alias '$a' = '$f'"
echo "Se ha creado y guardado el alias."
