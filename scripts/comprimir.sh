#!/bin/bash

directorio="/app/listas"
archivo_salida="$directorio/lista_imagenes.txt"
archivo_verificacion="$directorio/lista_verificado.txt"
nombre_con_a="$directorio/lista_nombres_a"
imagenes_desomprimidas="/app/imagenes-descomprimidas" 
mdkir -p "/app/importante"
mkdir -p $directorio
cd "$directorio"

if [[ ! (-e $imagenes_desomprimidas) ]]
then
	echo "Debe decomprimir primero las imagenes"
fi

# Obtener la lista de nombres de archivos de imágenes en el directorio
ls -1 $imagenes_desomprimidas > "$archivo_salida"
echo "Archivo generado: $archivo_salida"

# Generar archivo con la lista de nombres verificados
for archivo in $imagenes_desomprimidas/*; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^[A-Z][a-z]+([[:space:]][A-Z][a-z]+)$ ]]; then
            echo "$nombre_archivo" >> "$archivo_verificacion"
        fi
    fi
done
echo "Archivo generado: $archivo_verificacion"

# Generar archivo con la lista de nombres que finalizen con la letra "a"
for archivo in $imagenes_desomprimidas/*; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ .*a$ ]]; then
            echo "$nombre_archivo" >> "$nombre_con_a"
        fi
    fi
done
echo "Archivo generado: $nombre_con_a"

# Llevamos las imagenes recortadas al directorio listas
cp -R /app/imagenesRecortadas $directorio


# Crear archivo comprimido que incluye los archivos generados y la carpeta actual
nombre_archivo_comprimido="/app/importante/imagenes_listas.zip"
mv $imagenes_desomprimidas $directorio
cd "$directorio"
zip -r "$nombre_archivo_comprimido" .
echo "Archivo comprimido generado: $nombre_archivo_comprimido"

