#! /bin/bash

echo "Dame un alias prro: "
read alias

echo "Escriba el comando que realizará el alias: "
read comando

aliasCom="alias $alias='$comando'" && echo "$aliasCom" 
echo "$aliasCom" >> alias.txt
echo "Se ha creado un alias"
