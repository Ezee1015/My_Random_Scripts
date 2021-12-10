#!/bin/bash

function INSTALAR {

    mkdir ~/script
    cp Script/Backup\ Celular.sh ~/script/
    echo ""
    echo "El Script se encuentra en $HOME/script/Backup\ Celular.sh."
    echo "Puede crear un Acceso directo en el Escritorio que ejecute el siguiente comando:"
    echo "          bash $HOME/script/Backup\ Celular.sh"
}


function MENU {

    clear
    
    for number in {0..10}; do
        echo ""
    done
    
    echo "" ; echo ""
    read -p "Desea Instalar el Script de Backup de Celular? (S/N)>  " respuesta
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




