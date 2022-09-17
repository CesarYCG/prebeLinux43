#!/bin/bash

clear
echo "Dame el nombre de tu alias: "
read a

echo "Dame el comando: "
read c

al='alias '$a'="'$c'"'

cd /home/take && echo $al>>.bashrc

echo "el comando creado es: $al"
echo "ha sido creado exitosamente y guardado el alias"
