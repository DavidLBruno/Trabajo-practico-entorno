#!/bin/bash

directorio="images"

cd "$directorio" 

directorio_destino="../imagenesRecortadas"
mkdir -p "$directorio_destino"

for archivo in *; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        if [[ $nombre_archivo =~ ^[A-Z][a-z]+([[:space:]][A-Z][a-z]+)$ ]]; then
            echo "Nombre Verificado: $nombre_archivo"
            archivo_destino="$directorio_destino/$nombre_archivo"
            convert "$archivo" -resize 512x512^ -gravity center -extent 512x512 "$archivo_destino"
            echo "Imagen recortada: $archivo_destino"
        else
            echo "Nombre Inválido: $nombre_archivo"
           
        fi
    fi
done

