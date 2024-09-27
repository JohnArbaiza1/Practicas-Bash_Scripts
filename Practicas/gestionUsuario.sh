#! /bin/bash

#Script para la gestion de usuarios

#funcion para crear nuevos usuarios
agregar_User(){
	read -p "Agregue el nombre del nuevo usuario: " usuario
	sudo adduser $usuario
	sleep 3
	echo -e "Usuario creado\n"
}

#Funcion Para eliminar Usuario
delete_User(){
	read -p  "Ingrese el nombre del usuario a eliminar: " usuario
	sudo deluser $usuario
	sleep 3
	echo -e "Usuario Eliminado correctamente\n"
}

#Funcion para actualizar password
change_Password(){
	read -p "Ingrese el nombre del usuario: " usuario
	sudo passwd $usuario
	sleep 3
	echo
}

#Funcion para agregar un usuario a un grupo
agregar_A_Grupo(){
	read -p "Ingrese el nombre del usuario: " usuario
	read -p "Ingrese el nombre del grupo: " grupo
	sudo usermod -aG $grupo $usuario
	sleep 3
	echo -e "Usuario agregado exitosamente\n"
}

#Funcion para eliminar usuario de un grupo
user_delete_group(){
	read -p "Ingrese el nombre del usuario: " usuario
	read -p "Ingrese el nombre del grupo: " grupo
	sudo deluser $usuario $grupo
	sleep 3
	echo -e "Usuario Eliminado del Grupo\n"
}

#Funcion para listar  o mostrar los usuarios del sistema
list_User(){
	echo -e "\n------------------------------"
	echo "  USUARIOS DEL SISTEMA"
	echo    "------------------------------"
	sleep 3
	cut -d: -f1 /etc/passwd
	sleep 3
	echo -e "------------------------------\n"
}

#Funcion para cambiar permisos de un archivo o directorio
change_Permisos(){
	read -p "Ingrese el archivo o directorio: " archivo
	#Validacion 
	if [ ! -e "$archivo" ]; then
		echo -e "\nEL archivo o directorio no existe\n"
		return
	fi
	read -p "Ingrese los permisos (por ejemplo, 500):" permisos
	chmod $permisos $archivo
	sleep 2
	echo -e "Permisos Actualizados\n"
	ls -l $archivo
}

#Funcion para cambiar propietario de un archivo/directorio
cambiar_Propietario(){
	read -p "Ingrese el archivo o directorio: " archivo
        #Validacion
        if [ ! -e "$archivo" ]; then
        	echo "El archivo o directorio no existe."
        	return
    	fi
	read -p "Ingrese el nombre del propietario: " propietario
	#Validacion
	if ! id -u "$propietario" >/dev/null 2>&1; then
		echo -e "\n El propietario no Existe :(\n"
		return 
	fi
	sudo chown $propietario $archivo
	sleep 3
	echo -e "\n Propietario cambiado Exitosamente"
}

#Funcion para crear grupo
new_Group(){
	read -p "Ingrese el nombre del nuevo grupo: " grupo
	sudo groupadd $grupo
	sleep 3
	echo -e "Grupo Creado con Exito\n"
}

#Funcion para Eliminar grupo
delete_Group(){
	read -p "Ingrese el nombre del grupo a eliminar: " grupo
	sudo groupdel $grupo
	sleep 3
	echo -e "El grupo $grupo a sido eliminado correctamente\n"
}

#Funcion para listar los grupos
listar_grupos() {
    cut -d: -f1 /etc/group
}

#Menu de opciones a mostrar al usuario
while true; do
	echo "================================"
	echo "	 MENU DEL SISTEMA	      "
	echo "================================"
	echo "1. Agregar Usuario."
	echo "2. Eliminar Usuario."
	echo "3. Cambiar Password."
	echo "4. Agregar Usuario a grupo."
	echo "5. Eliminar Usuario de Grupo."
	echo "6. Mostrar Usuarios del Sistema."
	echo "7. Actualizar Permisos de Archivo/Directorio."
	echo "8. Cambiar propietario de archivo."
	echo "9. Crear nuevo Grupo."
	echo "10. Eliminar Grupo."
	echo "11. Listar Grupos."
	echo "12. Salir"
read -p "Seleccione una de las opciones: " opciones

case $opciones in 
	1) agregar_User;;
	2) delete_User;;
	3) change_Password;;
	4) agregar_A_Grupo;;
	5) user_delete_group;;
	6) list_User;;
	7) change_Permisos;;
	8) cambiar_Propietario;;
	9) new_Group;;
	10) delete_Group;;
	11) listar_grupos;;
	12) exit ;;
	*) echo "Opcion no valida";;
esac
done

