echo "Este script te ayudara a encontrar archivos"
echo "Esta es tu ruta actual: "
echo $(pwd)
r=()
echo -n "Ingrese la ruta donde quiera buscar su archivo: "
read r

echo -n "Ingrese la extension del archivo: "
read e

rf=$(find "$r" -type f -iname "*.$e")

test -f "$rf" && find "$r" -type f -iname "*.$e" >> route_find.txt || exit $?

echo "Creando fichero y tambien copia del archivo encontrado"
mkdir encontrado
cp ${rf[@]} encontrado
sleep 5s
echo "Este es el contenido del archivo: "
cd encontrado
a=$(ls)
cat ${a[@]}
sleep 10s
cd ..
rm -rf encontrado/
clear
