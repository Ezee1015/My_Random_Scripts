#!/bin/bash

function INSTALAR {

    mkdir ~/script
    cp Script/porcionador.sh ~/script/
    chmod +x ~/script/porcionador.sh
    echo ""
    echo "El Script se encuentra en $HOME/script/porcionador.sh"
    echo "Ejecute 'cd ~/script/ && ./porcionador.sh -h' Para ayuda"
}


function MENU {

    clear

    for number in {0..10}; do
        echo ""
    done

    echo "" ; echo ""
    read -p "Desea Instalar el Script 'porcionador'? (S/N)>  " respuesta
    clear
    echo "" ; echo ""

    case $respuesta in
        's' )   INSTALAR  ;;
        'si' )  INSTALAR  ;;
        'Si' )  INSTALAR  ;;
        'sI' )  INSTALAR  ;;
        'SI' )  INSTALAR  ;;
        'y' )   INSTALAR  ;;
        'yes' ) INSTALAR  ;;
        'YES' ) INSTALAR  ;;
        '1' )   INSTALAR  ;;
        'S' )   INSTALAR  ;;
        * )     echo "           Se ha elegido que NO. Se saldrá del Instalador." ;;
    esac

    echo "" ; echo ""

}

MENU
exit
