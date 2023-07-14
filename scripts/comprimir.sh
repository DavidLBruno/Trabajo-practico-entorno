#!/bin/bash

directorio="/app/images"
archivo_salida="$directorio/lista_imagenes.txt"
archivo_verificacion="$directorio/lista_verificado.txt"
nombre_con_a="$directorio/lista_nombres_a"

# Obtener la lista de nombres de archivos de imágenes en el directorio
ls -1 "$directorio" > "$archivo_salida"
echo "Archivo generado: $archivo_salida"

# Generar archivo con la lista de nombres verificados
for archivo in "$directorio"/*; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^[A-Z][a-z]+([[:space:]][A-Z][a-z]+)$ ]]; then
            echo "$nombre_archivo" >> "$archivo_verificacion"
        fi
    fi
done
echo "Archivo generado: $archivo_verificacion"

# Generar archivo con la lista de nombres que comienzan con la letra "a"
for archivo in "$directorio"/*; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^a ]]; then
            echo "$nombre_archivo" >> "$nombre_con_a"
        fi
    fi
done
echo "Archivo generado: $nombre_con_a"

# Crear archivo comprimido que incluye los archivos generados y la carpeta actual
nombre_archivo_comprimido="$directorio/imagenes_listas.zip"
zip -r "$nombre_archivo_comprimido" "$directorio"
echo "Archivo comprimido generado: $nombre_archivo_comprimido"

