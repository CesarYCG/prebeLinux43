#!/bin/bash

echo "Ingresa la ruta a buscar: "
read ruta
echo "Ingresa el nombre (con extension) del archivo: "
read archivo
ruta2=$(find $ruta -name $archivo)
echo "$ruta2" > route_find.txt && echo "Creando fichero y tambien copia del archivo encontrado"
mkdir encontrar ; cd encontrar
cp -a $ruta2 $archivo
sleep 10
cat $archivo
cd ..
rm -rf encontrar/
sleep 10
clear



