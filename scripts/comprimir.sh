#!/bin/bash

directorio="images"
archivo_salida="lista_imagenes.txt"
archivo_verificacion="lista_verificado.txt"
nombre_con_a="lista_nombres_a"

cd "$directorio" || exit 1

# Obtener la lista de nombres de archivos de imágenes en el directorio
ls -1 > "$archivo_salida"
echo "Archivo generado: $archivo_salida"

# Generar archivo con la lista de nombres verificados
for archivo in *; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^[A-Z][a-z]+([[:space:]][A-Z][a-z]+)$ ]]; then
            echo "$nombre_archivo" >> "$archivo_verificacion"
        fi
    fi
done

echo "Archivo generado: $archivo_verificacion"

# Generar archivo con la lista de nombres que comienzan con la letra "a"
for archivo in *; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^a ]]; then
            echo "$nombre_archivo" >> "$nombre_con_a"
        fi
    fi
done

echo "Archivo generado: $nombre_con_a"

# Crear archivo comprimido que incluye los archivos generados y la carpeta actual
nombre_archivo_comprimido="imagenes_listas.zip"
cd ..
zip -r "$nombre_archivo_comprimido" "$directorio" "$directorio/$archivo_salida" "$directorio/$archivo_verificacion" "$directorio/$nombre_con_a"
echo "Archivo comprimido generado: $nombre_archivo_comprimido"
