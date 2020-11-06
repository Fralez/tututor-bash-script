# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

menu_ssh() {
    until [ "$quit_menu_ssh" = "-1" ]; do
        echo "====================="
        echo "1 - Instalar SSH"
        echo "2 - Conectarse por SSH"
        echo "3 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        # Limpiar menu de la consola
        clear
        case "$opt" in
        1)
            # Opción 1
            sudo yum install openssh-server
            ;;
        2)
            # Opción 2
            connect_ssh
            ;;
        3)
            # Salir
            quit_menu_ssh="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
        if [ "$quit_menu_ssh" != "-1" ]; then
            echo
            echo "Presione enter para volver al menú o [ctrl + c] para salir..."
            read
            clear
        fi
    done
}

connect_ssh() {
    echo "Ingresa la IP/DNS de donde deseas conectarte"
    read target_ip
    echo "Ingresa el usuario que utilizarás par conectarte"
    read target_user
    echo "Ingresa la contraseña de ese usuario"
    read target_password

    ssh "$target_user:$targer_password@$target_ip"
}

menu_ssh
