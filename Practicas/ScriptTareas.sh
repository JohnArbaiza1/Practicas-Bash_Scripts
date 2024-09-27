#! /bin/bash

#Mensajes de bienvenida
echo "==================================================="
echo "		     BIENVENIDO			"
echo "==================================================="

#Indicamos al usuario que ingrese la opcion para crear los scrits de las tareas
cat << mensaje
Por favor ingrese la  palabra crear para dar inicio
con las tareas del programa
mensaje
echo "==================================================="


#Definimos las variables a usar para dar inicio al programa
ejecutar="crear"
read -p ">>>>" palabra

: 'Verificamos con un condicional la palabra ingresada para dar
 inicio al programa y sus tareas'
if [[ $ejecutar == $palabra ]];
then
#Parte donde se crea un directorio para almacenar los scripts
#--------------------------------------------------------------------------------
	echo -e "\nDirectorio para los Scrpits Creado"
	#Definimos una variable para que contenga el nombre del directorio
        nombreDirectorio="ContenedorScripts"
        mkdir -p "$nombreDirectorio"
	touch "prueba.txt"
        #Usamos sleep para dar un tiempo de espera al proximo mensaje
        sleep 3

#Parte del script para el otorgamiento de permisos a los diferentes archivos
#---------------------------------------------------------------------------------
: 'Usamos cat con un marcador heredoc para crear el scripts de los permisos
   especificando el directorio donde se guardara '
   cat << 'per' > "$nombreDirectorio/ScriptPermisos.sh"
#!/bin/bash

#Pedimos al usuario el nombre del archivo para cambiar sus permisos
read -p  "Ingrese el nombre del archivo para modificar permisos: " archivo

#Verificamos con un condicional si el archivo existe
if [ ! -f "$archivo" ]; then   #-f lo que hace es verificar si el archivo especificado por la variable existe
    echo "El archivo no existe."
    exit 1
fi

#Solicitamos que el usuario ingrese los permisos deseados y damos un ejemplo
read -p "Ingrese los permisos deseados (por ejemplo, 500):" permisos

#Cambiamos los permisos del archivo
chmod "$permisos" "$archivo"
echo "Permisos modificados a $permisos para $archivo"
per

#Otorgamos permisos de ejecucion al script que creamos 
chmod +x "$nombreDirectorio/ScriptPermisos.sh"

    echo -e "\nIniciando la creación de scripts..."
    sleep 2
    echo -e "\nScripts Creados Correctamente :)"

#Parte del Ejercicio 1: Mostrar el contenido de un archivo
#---------------------------------------------------------------------------------
   cat << 'muestra' > "$nombreDirectorio/Ejercicio1.sh"
#!/bin/bash

#Indicamos al usuario que ingrese el nombre del archivo
read -p "Ingrese el nombre del archivo a mostrar su contenido" nameArchivo

#Verificamos la existencia del archivo
if [[ -f "$nameArchivo" ]];
then 
     #Mostramos el contenido
     echo -e "Contenido de $nameArchivo \n"
     cat "$nameArchivo"
     echo
else
     echo -e "El archivo no Existe "
fi

muestra

#Damos los permisos de ejecucion
chmod +x "$nombreDirectorio/Ejercicio1.sh"

#Parte del Ejecicio 2: Suma de dos numeros
#---------------------------------------------------------------------------------
    cat << 'ejer2' > "$nombreDirectorio/Ejercicio2.sh"
#!/bin/bash

read -p "Ingrese el primer numero a sumar: " num1
read -p "Ingrese el segundo numero a sumar: " num2

suma=$((num1+num2))
echo -e "\nEL resultado de la suma es: $suma"
ejer2

#Otorgamos los permisos
chmod +x "$nombreDirectorio/Ejercicio2.sh"

#Parte del Ejercicio3 Contar Arcchivos en un directorio
#---------------------------------------------------------------------------------
    cat << 'ejer3' > "$nombreDirectorio/Ejercicio3.sh"
#!/bin/bash 

#Pedimos al usuario que ingrese la ruta del directorio a contar sus archivos
read -p "Ingrese la ruta del direcctorio: " ruta

# Verificamos la existencia del directorio
if [[ -d "$ruta" ]]; then
    # Contamos el número de archivos en el directorio
    count=$(ls -1 "$ruta" | wc -l)
    echo -e "\nEl número de archivos en este directorio es: $count"
else
    echo -e "\nEl directorio no existe"
fi
ejer3
#Damos permisos al archivo
chmod +x "$nombreDirectorio/Ejercicio3.sh"

#Parte del ejercicio4 crear un archivo de texto
#---------------------------------------------------------------------------------
cat << 'ejer4' > "$nombreDirectorio/Ejercicio4.sh"
#!/bin/bash

echo -e "\nCreacion de archivo vacio"
read -p "Ingrese el nombre de su nuevo: " archivo
touch $archivo.txt
sleep 2 
echo "Archivo $archivo creado correctamente"
ejer4
chmod +x "$nombreDirectorio/Ejercicio4.sh"

#Parte del ejercicio 5 mostrar los procesos  con mas consumo por el cpu
#---------------------------------------------------------------------------------
   cat << 'ejer5' > "$nombreDirectorio/Ejercicio5.sh"
#!/bin/bash

echo "Los 10 procesos más consumidos por CPU son:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 11
ejer5

chmod +x "$nombreDirectorio/Ejercicio5.sh"

#Parte del ejercicio 6 Mostrar espacio en disco
#---------------------------------------------------------------------------------
   cat << 'ejer6' > "$nombreDirectorio/Ejercicio6.sh"
#!/bin/bash

echo "Uso de espacio en disco:"
df -h
ejer6

chmod +x "$nombreDirectorio/Ejercicio6.sh"

#Parte del ejercicio 7 validar si un  numero es impar
#---------------------------------------------------------------------------------
   cat << 'ejer7' > "$nombreDirectorio/Ejercicio7.sh"
#!/bin/bash

echo -e "\nValidacion de numeros"
read -p "Ingrese un numero: " num

if [ $((num % 2)) -eq 0 ]; then
    echo "$numero es par."
else
    echo "$numero es impar."
fi
ejer7
chmod +x "$nombreDirectorio/Ejercicio7.sh"

#Parte del ejercicio 8 Calcular el factorial de un numero
#--------------------------------------------------------------------------------
   cat << 'ejer8' > "$nombreDirectorio/Ejercicio8.sh"
#!/bin/bash

echo -e "\nCalculo del factorial"
read -p "Ingrese un numero para calcular el factorial de este: " numero
factorial=1
for (( i=1; i<=numero; i++ )); do
    factorial=$((factorial * i))
done
echo "El factorial de $numero es: $factorial"
ejer8

chmod +x "$nombreDirectorio/Ejercicio8.sh"

#Parte del menu para elegir que script ejecutar
#----------------------------------------------------------------------------------
while true; do
    echo "==================================================="
    echo "                 MENÚ DE SCRIPTS                   "
    echo "==================================================="
    echo "1. Otorgar permisos a un archivo"
    echo "2. Mostrar contenido de un archivo"
    echo "3. Sumar dos números"
    echo "4. Contar archivos en un directorio"
    echo "5. Crear un archivo de texto"
    echo "6. Mostrar los 10 procesos más consumidos por CPU"
    echo "7. Mostrar espacio en disco"
    echo "8. Validar si un número es par o impar"
    echo "9. Calcular el factorial de un número"
    echo "10. Eliminar directorio contenedor de Scripts"
    echo "11. Salir"
    echo "==================================================="
    read -p "Seleccione una opción: " opcion

  case $opcion in
  1) bash "$nombreDirectorio/ScriptPermisos.sh";;
  2) bash "$nombreDirectorio/Ejercicio1.sh";;
  3) bash "$nombreDirectorio/Ejercicio2.sh";;
  4) bash "$nombreDirectorio/Ejercicio3.sh";;
  5) bash "$nombreDirectorio/Ejercicio4.sh";;
  6) bash "$nombreDirectorio/Ejercicio5.sh";;
  7) bash "$nombreDirectorio/Ejercicio6.sh";;
  8) bash "$nombreDirectorio/Ejercicio7.sh";;
  9) bash "$nombreDirectorio/Ejercicio8.sh";;
  10) rm -r ContenedorScripts;;
  11) echo "Saliendo...."; exit 0 ;;

esac
done

else
     echo
     cat << "advertencia"
Parece que ha ocurrido un Error :(
Intente de nuevo
advertencia
fi


