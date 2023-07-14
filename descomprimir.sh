#!/bin/bash
 
archivo=$1
validacion=$2

echo $archivo $validacion

if [[ -z $archivo || -z $validacion ]]
then
  echo Debe colocar un archivo comprimido y una suma de veirificacion.
  exit 0
fi

if [[ $archivo && $validacion ]]
then
 echo $archivo debe ser un archivo comprimido.
  exit 0
fi

if [[ ]]
  echo $validacion debe ser una suma de verificacion.
  exit 0
then
fi

echo Archivo descomprimido con exito!

exit 0

