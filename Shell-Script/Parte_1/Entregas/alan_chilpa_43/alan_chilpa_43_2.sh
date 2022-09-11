#!/bin/bash

usuario=$(whoami)
echo "Bienvenido $usuario"
echo "Ingesa tu nombre"
read nombre
echo "$nombre">>Death_script.txt
contador=$(wc -w Death_script.txt | cut -d ' ' -f 1)
echo "$contador"
while IFS= read -r line 
do
	echo "$line"
done<Death_script.txt
