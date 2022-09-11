#!/bin/bash
clear
touch u
getent passwd | grep x:1000 | cut -d: -f1>>u
usu=$(cat u)
echo "Bienvenido $usu"
touch Death_script.txt
echo "Ahora a quien mataras $usu: "
read nam
echo $nam>>Death_script.txt 2>&1
declare -a nom
i=0
while read linea
do
nom[$i]="$linea"
((i++))
done < Death_script.txt
echo "El numero de personas que has anotado $usu es: ${#nom[@]}"
for i in "${nom[@]}"
do
	echo "$i"
done
rm -r u
