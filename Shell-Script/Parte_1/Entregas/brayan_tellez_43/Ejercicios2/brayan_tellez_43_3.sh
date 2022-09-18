#!/bin/bash

user=$(whoami)

fileName=$(sudo find /etc -name shadow)

echo "$fileName"

echo "Copiando $fileName a -> ~/Desktop/shadow"
sudo cp $fileName "/home/$user/Desktop/copiaShadow"

echo -n "Ingrese el nuevo propietario: "
read owner

sudo chmod 666 "/home/$user/Desktop/copiaShadow"
sudo chown $owner:$ower -R "/home/$user/Desktop/copiaShadow"

echo "Terminado."
