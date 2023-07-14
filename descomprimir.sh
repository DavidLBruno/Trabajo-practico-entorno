#!/bin/bash
 
archivo=$1
validacion=$2

if [[ -z $archivo || -z $validacion ]]
then
	echo Debe colocar al menos dos valores.
	exit 0
elif [[ ! -e $archivo ]]
then
	echo $archivo Debe existir.
	exit 0
elif [[ ! -e $validacion ]]
then
	echo $validacion Debe existir.
	exit 0
elif [[ $archivo != *.zip ]]
then
        echo $archivo debe ser un archivo comprimido.
        exit 0
elif [[ $validacion != *.zip.sum ]]
then
        echo $validacion debe ser una suma de verificacion.
	exit 0
fi

suma_verificacion=$(cat $validacion | awk '{ print $1 }')
hash=$(md5sum images.zip | awk '{ print $1 }')

if [[ "$suma_verificacion" != "$hash" ]]
then
	echo La suma de verificacion no coinciden.
	exit 0
fi

unzip $archivo -d ./imagenes-descomprimidas
echo Archivo descomprimido con exito!

exit 0

