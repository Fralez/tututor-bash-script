# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

main() {
    menu
}

menu() {
    until [ "$quit_menu" = "-1" ]; do
        echo "====================="
        echo "1 - Menu usuarios Linux"
        echo "2 - Menu usuarios DB"
        echo "3 - Menu SSH"
        echo "4 - Menu extras"
        echo "5 - Salir"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        # Limpiar menu de la consola
        clear
        case "$opt" in
        1)
            # Opción 1
            bash menu_usuarios_linux.sh
            ;;
        2)
            # Opción 2
            bash menu_usuarios_db.sh
            ;;
        3)
            # Opción 3
            bash menu_ssh.sh
            ;;
        4)
            # Opción 3
            bash menu_extras.sh
            ;;
        5)
            # Salir
            echo "¡Nos vemos!"
            echo
            quit_menu="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
        if [ "$quit_menu" != "-1" ]; then
            echo
            echo "Presione enter para volver al menú o [ctrl + c] para salir..."
            read
            clear
        fi
    done
}

main
