#! /bin/bash

echo "Dame la ruta del archivo que quieres que encuentre"
read dir
echo "$dir"
echo "Dame el nombre y extension del archivo: "
read arch

dirR=$(find $dir -name $arch)

echo "$dirR" > route_find.txt && echo "Creando  fichero y tambien copia del archivo encontrado"
mkdir encontrado ;  cd encontrado
cp -a $dirR $arch
sleep  10
cat $arch
cd ..
rm -rf encontrado/
sleep 10
clear

