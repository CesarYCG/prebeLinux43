#!/bin/bash
user=$(whoami)
dx=()
dx="/home/$user/Escritorio/" && cd ${dx[@]} || dx "/home/$user/Desktop/" && cd ${dx[@]}
touch shadow.txt
dz=()
dz=$(sudo find /etc/ -iname shadow)
sudo cat ${dz[@]} > shadow.txt
echo "Terminado."
