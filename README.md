# Como construir el docker

sudo docker build -t tp-entorno .

# Como ejecutar el proyecto

bash ejecutar_contenedor

# Comando para ejecutar el docker e ingresar al archivo comprimido en caso de que ejecutar no funcione

sudo docker run -it -v /ruta/al/directorio/imagenes:/app/images tp-entorno

## Ejemplo

sudo docker run -it -v /home/mateo/Escritorio/Trabajo-practico-entorno/imagenes:/app/images tp-entorno

## Interactuar con el menu

# Opcion 1
Salir del programa.

# Opcion 2
Generar imagenes deseadas, se deberá indicar la cantidad.

# Opcion 3
Descomprimir el archivo generado por la opcion 5.

# Opcion 4
Procesar las imagenes:
Se recortaran solo las imágenes validas en una resolución de 512*512, se toma como imagen valida a toda aquella que empieze por una letra mayuscula y continue con una minuscula.

# Opcion 5
Comprimir las imagenes ya generadas

– genera un archivo con la lista de nombres de todas las imágenes.

– genera un archivo con la lista de nombres válidos.

– genera un archivo con el total de personas cuyo nombre finaliza con
  la letra a.
  
– por último, genera un archivo comprimido que incluya los archivos
  generados en los items anteriores y todas las imágenes.




