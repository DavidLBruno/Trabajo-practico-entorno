# Como contruir el .iso del proyecto

## Comando
sudo docker build-t tp-entorno .

# Como ejecutar el proyecto

## Comando:
sudo docker run -it -v /path/to/local/dir:/app tp-entorno

sudo docker run -it -v ./final_images:/app/final_images tp-entorno



# Interactuar con el menu

## Opcion 2
## Opcion 3
## Opcion 4
## Opcion 5


#comando para ejecutar el docker e ingresar al archivo comprimido
sudo docker run -it -v /ruta/al/directorio/imagenes:/app/images tp-entorno

#ejemplo
sudo docker run -it -v /home/mateo/Escritorio/Trabajo-practico-entorno/imagenes:/app/images tp-entorno

