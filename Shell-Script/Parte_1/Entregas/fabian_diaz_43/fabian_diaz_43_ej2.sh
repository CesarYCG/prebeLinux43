user=$(whoami)

echo "Bienvenido $user"

arreglo=()

echo -n "Dame el nombre de la siguiente victima: "
read arreglo

echo "$arreglo" >> Death_script.txt

num=$(wc -l Death_script.txt | cut -c 1-2)

echo "Ya tenemos: $num victima(s) anotadas"

cat Death_script.txt

