#!/bin/bash

usuario=$(whoami)
find /etc/shadow && sudo cp /etc/shadow /home/$usuario/Desktop && echo "Terminado"
echo "El usuario es: $usuario"
