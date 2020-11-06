# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

menu_usuarios_db() {
    until [ "$quit_menu_usuarios_db" = "-1" ]; do
        echo "====================="
        echo "1 - Crear usuario en la base de datos"
        echo "2 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        # Limpiar menu de la consola
        clear
        case "$opt" in
        1)
            # Opción 1
            create_user
            ;;
        2)
            # Salir
            quit_menu_usuarios_db="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
        if [ "$quit_menu_usuarios_db" != "-1" ]; then
            echo
            echo "Presione enter para volver al menú o [ctrl + c] para salir..."
            read
            clear
        fi
    done
}

create_user() {
    
}

menu_usuarios_db
