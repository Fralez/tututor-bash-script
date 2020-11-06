# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

list() {
    quit_list="0"
    until [ "$quit_list" = "-1" ]; do
        # Limpiar menu de la consola
        clear
        echo "====================="
        echo "1 - Listar Usuario"
        echo "2 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        case "$opt" in
        1)
            list_users
            ;;
        2)
            clear
            quit_list="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
    done
}

list_users() {
    clear

    more usuarios
    
    echo
    echo
    echo "Presione enter para continuar"
    read
}

list
