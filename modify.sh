# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

modify() {
    quit_modify="0"
    until [ "$quit_modify" = "-1" ]; do
        # Limpiar menu de la consola
        clear
        echo "====================="
        echo "1 - Modificar Usuario - Nombre"
        echo "2 - Modificar Usuario - Fecha de nacimiento"
        echo "3 - Modificar Usuario - Email"
        echo "4 - Volver al menu principal"
        echo "====================="
        echo "Elija una opción y presione enter..."
        echo
        read opt

        if [ "$opt" = "4" ]; then
            clear
            quit_modify="-1"
        else
            echo "Ingrese la CI de la persona que quiere modificar"
            read ci

            if [ -n "$ci" ]; then
                if grep -q "$ci" usuarios; then
                    case "$opt" in
                    1)
                        modify_user_name
                        ;;
                    2)
                        modify_user_birth_date
                        ;;
                    3)
                        modify_user_email
                        ;;
                    *)
                        echo "Elija una opción válida. Presione enter para continuar"
                        read
                        ;;
                    esac
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
        fi

    done
}

modify_user_name() {
    echo "Ingrese el nuevo nombre"
    read new_name
    name=$(grep $ci usuarios | cut -f2 -d"|")
    cat usuarios >temp
    $(grep $ci temp | sed -i "s/$name/$new_name/g" temp)
    cat temp >usuarios
    rm temp
    echo "Modificación exitosa! Presiona enter para continuar"
    read
}

modify_user_birth_date() {
    echo "Ingrese la nueva fecha de nacimiento"
    read new_birth_date
    birth_date=$(grep $ci usuarios | cut -f3 -d"|")
    cat usuarios >temp
    $(grep $ci temp | sed -i "s/$birth_date/$new_birth_date/g" temp)
    cat temp >usuarios
    rm temp
    echo "Modificación exitosa! Presiona enter para continuar"
    read
}

modify_user_email() {
    echo "Ingrese el nuevo email"
    read new_email
    email=$(grep $ci usuarios | cut -f4 -d"|")
    cat usuarios >temp
    $(grep $ci temp | sed -i "s/$email/$new_email/g" temp)
    cat temp >usuarios
    rm temp
    echo "Modificación exitosa! Presiona enter para continuar"
    read
}

modify
