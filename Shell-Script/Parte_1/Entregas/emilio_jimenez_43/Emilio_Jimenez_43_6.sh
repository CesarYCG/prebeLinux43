#!/bin/bash
fin=$(sudo find / -iname "shadow" -exec cp "{}" /home/take/Escritorio \;)
$fin
echo "terminado"
