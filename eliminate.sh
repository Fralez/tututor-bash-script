# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

eliminate() {
    quit_eliminate="0"
    until [ "$quit_eliminate" = "-1" ]; do
        # Limpiar menu de la consola
        clear
        echo "====================="
        echo "1 - Eliminar Usuario"
        echo "2 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        case "$opt" in
        1)
            eliminate_user
            ;;
        2)
            clear
            quit_eliminate="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
    done
}

eliminate_user() {
    echo "Ingrese la CI:"
    read ci

    if [ -n "$ci" ]; then
        if grep -q "$ci" usuarios; then
            echo "Esta seguro de que quiere eliminarlo? y/n"
            read sure
            if [ $sure = "y" ]; then
                grep -v $ci usuarios >temp
                cp temp usuarios
                rm temp
            fi
        else
            echo "Lo siento, la cedula $ci no esta registrada en nuestro sistema."
            echo
            echo "Presione enter para continuar"
            read
        fi
    else
        echo "Debe ingresar una cedula."
        echo
        echo "Presione enter para continuar"
        read
    fi
}

eliminate
