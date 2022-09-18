#!/bin/bash

echo "Ingresa el nombre del alias: "
read nombrealias

echo "Ingresa la funcion para sustituirla"
read funcion

echo "alias $nombrealias" = "'$funcion'" >> alias.txt && echo "se ha creado"
echo "alias $nombrealias = '$funcion'"
while IFS= read -r line 
do
        echo "$line"
done<alias.txt

