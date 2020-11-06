# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

menu_usuarios_linux() {
    until [ "$quit_menu_usuarios_linux" = "-1" ]; do
        echo "====================="
        echo "1 - Crear"
        echo "2 - Modificar"
        echo "3 - Eliminar"
        echo "4 - Listar"
        echo "5 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        # Limpiar menu de la consola
        clear
        case "$opt" in
        1)
            # Opción 1
            bash create.sh
            ;;
        2)
            # Opción 2
            bash modify.sh
            ;;
        3)
            # Opción 3
            bash eliminate.sh
            ;;
        4)
            # Opción 3
            bash list.sh
            ;;
        5)
            # Salir
            quit_menu_usuarios_linux="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
        if [ "$quit_menu_usuarios_linux" != "-1" ]; then
            echo
            echo "Presione enter para volver al menú o [ctrl + c] para salir..."
            read
            clear
        fi
    done
}

menu_usuarios_linux
