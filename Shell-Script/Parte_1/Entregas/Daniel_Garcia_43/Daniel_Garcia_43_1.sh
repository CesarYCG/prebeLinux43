#!/bin/bash

echo "Ingresa el nombre para tu alias: "
read nombrealias

echo "Ingresa la funcion que quieres para tu alias: "
read nombrefuncion

echo alias "$nombrealias"="'$nombrefuncion'" >> alias.txt && echo "Se ha creado tu alias con exito"
echo "Su comando: $nombrealias='$nombrefuncion'"


