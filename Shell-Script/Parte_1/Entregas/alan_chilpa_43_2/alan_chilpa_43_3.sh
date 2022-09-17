#!/bin/bash
usu=$USER
find /etc/shadow 
sudo cp /etc/shadow /home/$usu/Escritorio 
echo "Terminado"

