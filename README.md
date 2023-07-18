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
Salir del programa

# Opcion 2
Generar imagenes deseadas

# Opcion 3
Descomprimir el archivo generado por la opcion 5

# Opcion 4
Procesar las imagenes

# Opcion 5
Comprimir las imagenes ya generadas




