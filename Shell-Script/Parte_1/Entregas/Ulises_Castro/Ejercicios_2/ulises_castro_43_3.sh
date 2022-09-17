#! /bin/bash

sudo cp /etc/shadow  ~/Escritorio/copia.txt || sudo cp /etc/shadow ~/Desktop/copia.txt 
sudo chmod +r ~/Escritorio/copia.txt || sudo chmod +r ~/Desktop/copia.txt
echo "terminado"
