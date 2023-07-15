#!/bin/bash
 
ubicacion_archivo="/app/images.zip"
ubicacion_verificacion="/app/images.zip.sum"

echo $ubicacion_archivo
echo $ubicacion_verificacion

if [[ ! ( -e $ubicacion_archivo || -e $ubicacion_verificacion ) ]]
then
	echo Debe generar las imagenes primero.
	exit 1
fi

suma_verificacion=$(cat $ubicacion_verificacion | awk '{ print $1 }')
hash=$(md5sum $ubicacion_archivo | awk '{ print $1 }')

echo $suma_verificacion
echo $hash

if [[ "$suma_verificacion" != "$hash" ]]
then
	echo La suma de verificacion no coinciden.
	exit 1
fi

unzip $ubicacion_archivo -d ./imagenes-descomprimidas
echo Archivo descomprimido con exito!
exit 0

