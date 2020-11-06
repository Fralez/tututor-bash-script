# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

create() {
    quit_create="0"
    until [ "$quit_create" = "-1" ]; do
        # Limpiar menu de la consola
        clear
        echo "====================="
        echo "1 - Crear Usuario"
        echo "2 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt
        case "$opt" in
        1)
            create_user
            ;;
        2)
            clear
            quit_create="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
    done
}

create_user() {
    echo "Ingrese la CI:"
    read ci
    if [ -n "$ci" ]; then
        if grep -q "$ci" usuarios; then
            echo "Lo siento, pero esa cedula ya esta registrada! Intenta con otra, o borra el usuario con la cedula: $ci"
            echo
            echo "Presione enter para continuar"
            read
        else
            echo "Ingrese el nombre:"
            read name

            echo "Ingrese la fecha de nacimiento usando guiones (-) de por medio:"
            read birth_date

            echo "Ingrese el email:"
            read email

            echo "$ci|$name|$birth_date|$email" >>usuarios

            # Ordeno y cambio por el original
            sort -k2 -t '|' usuarios >usuarios.sort
            cp usuarios.sort usuarios
            rm usuarios.sort
        fi
    else
        echo "Debe ingresar una cedula."
        echo
        echo "Presione enter para continuar"
        read
    fi
}

create
