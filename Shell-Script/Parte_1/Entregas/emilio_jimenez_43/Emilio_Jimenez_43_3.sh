#! /bin/bash

echo "Dame la ruta del archivo: "
read r
echo "Nombre.extencion del archivo : "
read t

bus=$(find $r -name $t)

echo "$bus" > route_find.txt && echo "Creando  fichero y tambien copia del archivo encontrado"
mkdir encontrado ;  cd encontrado
cp -a $bus $t
sleep  10
cat $t
cd ..
rm -rf encontrado/
sleep 10
clear




