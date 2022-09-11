#! /bin/bash

echo "Ruta a encontrar"
read ruta
echo "$dir"
echo "Dame el nombre y extension del archivo: "
read archivo

dirR=$(find $ruta -name $archivo)

echo "$RuraR" > route_find.txt && echo "Fichero creandose y copiandose del archivo ya encontrado"
mkdir encontrado ;  cd encontrado
cp -a $RutaR $archivo
sleep  10
cat $archivo
cd ..
rm -rf encontrado/
sleep 10
clear
