#!/bin/bash

echo "Bienvenido $(whoami)"
echo "Ingresa el nombre del afortunado"
read a
echo "$a">>Death_script.txt

while read -r linea
do
	nombres+=("$(echo "$linea")")
done<Death_script.txt

contador=$(wc -w Death_script.txt | cut -d ' ' -f 1 )
echo "persona numero $contador: $a"

echo "lista de personas que se encuentan escritas:"
for i in "${nombres[@]}"
do
	echo "$i"
done
