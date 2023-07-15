#!/bin/bash
PS3='Seleccione --> '

cd scripts

echo Que desea hacer?
select opcion in "SALIR" "GENERAR" "DESCOMPRIMIR" "PROCESAR" "COMPRIMIR"
do
  [ -e $opcion ] && echo "Elegir una opcion valida!" && continue
  [ $REPLY == 1 ] && echo "Hasta luego!" && chmod -R a+rwx ../images && break
  echo "Opcion elegida: " $opcion

  case $opcion in
    GENERAR)
      read -p "Ingrese la cantidad de imagenes: " cantidad
      
      if [[ $cantidad =~ ^[0-9] ]]
      then
      	bash generar.sh $cantidad
      else
	echo "Debe colocar numeros enteros positivos!"    
      fi    
      ;;
    DESCOMPRIMIR)
      bash descomprimir.sh
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

