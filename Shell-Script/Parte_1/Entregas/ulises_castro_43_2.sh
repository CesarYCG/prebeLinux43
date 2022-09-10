#! /bin/bash

printf "Que onda usuario " && whoami && echo " "

pers=()

echo "Quien merece la muerte >:)  : "
read ppl 

echo "$ppl">> Death_script.txt &&  printf "Cantidad de personas en la lista: " && wc -l Death_script.txt && echo "Nombres  guardados: "
while read p;
do
	echo "$p"
done <Death_script.txt

