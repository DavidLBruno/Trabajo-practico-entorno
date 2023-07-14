#!/bin/bash

directorio="images"
archivo_salida="lista_imagenes.txt"

cd "$directorio" || exit 1

# Obtener la lista de nombres de archivos de imágenes en el directorio
ls -1 > "$archivo_salida"

echo "Archivo generado: $archivo_salida"

