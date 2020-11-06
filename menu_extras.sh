# !/bin/sh
# Autor: TuTutor
# Fecha: 13/11

menu_extras() {
    until [ "$quit_menu_extras" = "-1" ]; do
        echo "====================="
        echo "1 - Ping"
        echo "2 - Ifconfig"
        echo "3 - Dig"
        echo "4 - Nslookup"
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
            echo - Ping:
            echo Introduzca su DNS o dirección IP
            read pingTarget
            
            ping $pingTarget -c 10
            msj="Ping finalizado."
            ;;
        2)
            # Opción 2
            echo - Ifconfig:
            echo Presione enter para hacer un ifconfig de su equipo
            read
            
            ifconfig
            msj="Ifconfig finalizado."
            ;;
        3)
            # Opción 3
            echo - Dig:
            echo Introduzca su DNS a interrogar
            read dns
            
            dig $dns
            msj="Se ha interrogado la DNS $dns"
            ;;
        4)
            # Opción 4
            echo - Nslookup:
            echo Introduzca su DNS para saber la dirección IP
            read lookupTarget
            
            nslookup $lookupTarget
            msj="Se ha ejecutado un lookup de dirección IP sobre el input dado."
            ;;
        5)
            # Salir
            quit_menu_extras="-1"
            ;;
        *)
            echo "Esa opcion no es valida! Intente con una diferente. Presione enter para continuar"
            read
            ;;
        esac
        if [ "$quit_menu_extras" != "-1" ]; then
            echo
            echo "Presione enter para volver al menú o [ctrl + c] para salir..."
            read
            clear
        fi
    done
}

menu_extras
