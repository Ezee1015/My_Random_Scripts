
#!/bin/bash

function INSTALAR {

    mkdir ~/script
    cp Script/Suspender\ Talkie-Clock.sh ~/script/
    cp Script/Talkie-Clock.sh ~/script/
    # cp Script/Talkie-Clock.sh ~/.config/autostart
    
    (crontab -l 2>/dev/null; echo "@reboot bash $HOME/script/Talkie-Clock.sh") | crontab -

}


function MENU {

    clear
    
    for number in {0..10}; do
        echo ""
    done
    
    echo "" ; echo ""
    read -p "Desea Instalar Talkie-Clock? (S/N)>  " respuesta
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




