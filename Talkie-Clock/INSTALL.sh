
#!/bin/bash

function INSTALAR {

    mkdir ~/script
    mkdir ~/Música/
    mkdir ~/Música/Talkie-Clock\ Audios
    cp Script/Suspender\ Talkie-Clock.sh ~/script/
    cp Script/Talkie-Clock.sh ~/script/
    # cp Script/Talkie-Clock.sh ~/.config/autostart
    
    (crontab -l 2>/dev/null; echo "@reboot bash $HOME/script/Talkie-Clock.sh") | crontab -

    echo "Para que el programa funcione, cree archivos de audio en..."
    echo " $HOME/Música/Talkie-Clock\ Audios/SonLasXX.mp3"
    echo "Donde XX es la hora. Por ejemplo: 03, 12, 15, etc."

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




