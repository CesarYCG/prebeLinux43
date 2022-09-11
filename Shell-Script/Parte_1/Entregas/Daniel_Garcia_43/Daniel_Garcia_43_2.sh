#!/bin/bash

usuario=$(whoami)
echo "Bienvenido $usuario"
echo "Ingresa un nombre: "
read nombre
echo "$nombre">>Death_script.txt
while read -r linea #Leer el achivo usando un loop while e ir agregando elementos al array
do
	nombres+=("$(echo "$linea")")
done<Death_script.txt
contador=$(wc -w Death_script.txt | cut -d ' ' -f 1) #Sirve para cortar toda la parte del nombre del archivo
echo "$contador"
for i in "${nombres[@]}" #Imprimir elemento por elemento del array
do
	echo "$i"
done

