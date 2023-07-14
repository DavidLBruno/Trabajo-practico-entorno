#!/bin/bash
PS3='Seleccione --> '

cd scripts

echo Que desea hacer?
select opcion in "SALIR" "GENERAR" "DESCOMPRIMIR" "PROCESAR" "COMPRIMIR"
do
  [ -e $opcion ] && echo "Elegir una opcion valida!" && continue
  [ $REPLY == 1 ] && echo "Hasta luego!" && break
  echo "Opcion elegida: " $opcion

  case $opcion in
    GENERAR)
      read -p "Ingrese la cantidad de imagenes: " cantidad
      bash generar.sh $cantidad
      ;;
    DESCOMPRIMIR)
      read -p "Ingrese archivo comprimido: " archivo 
      read -p "Ingrese una suma de verificacion: " validacion
      bash descomprimir.sh $archivo $validacion
      ;;
    PROCESAR)
      bash procesar.sh
      ;;
    COMPRIMIR)
      bash comprimir.sh
      ;;
    *)
      echo Por causalidad la opcion no es correcta
      ;;
  esac

done

exit 0

