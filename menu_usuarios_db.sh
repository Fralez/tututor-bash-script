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
    echo "Ingrese su email"
    read email
    
    echo "Ingrese su contraseña"
    read password
    
    echo "Ingrese su cédula"
    read identity_number
    
    echo "Ingrese su nombre"
    read name
    
    echo "Indique su género seleccionando un número"
    echo "1 - Hombre"
    echo "2 - Mujer"
    echo "0 - Otro"
    read gender
    
    echo "Ingrese su fecha de nacimiento con formato AÑO-MES-DIA (ejemplo: 2003-08-25)"
    read birth_date

    req_json='{ "user": { "email": "'$email'", "password": "'$password'", "identity_number": "'"$identity_number"'", "name": "'$name'", "gender": '"$gender"', "birth_date": "'"$birth_date"'" } }'
    response=$(curl -XPOST -H "Content-type: application/json" -d "$req_json" -s 'https://tututor-backend.herokuapp.com/users')

    echo "El servidor ha respondido con lo siguiente:"
    echo
    echo
    echo $response
}

menu_usuarios_db
