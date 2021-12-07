
#!/bin/bash

function INSTALAR {

    mkdir ~/script/
    mkdir ~/script/Data_Temp_Scripts
    
    cp -rf Script/Camara_Web.sh ~/script/
    cp -rf Script/Camara_Autorun.sh  ~/script/

    (crontab -l 2>/dev/null; echo "@reboot bash $HOME/script/Camara_Autorun.sh") | crontab -

    sudo modprobe -a uvcvideo
    echo "CameraStatus=On" > ~/.script/Data_Temp_Scripts/CameraWeb.config
    echo "[Desktop Entry]" > ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Version=1.0" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Type=Application" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Name=Desactivar la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Comment=Activa/Desactiva la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Exec=bash ~/.script/Camara_Web.sh" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Icon=camera" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Path=" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Terminal=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "StartupNotify=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    chmod +x ~/Escritorio/Conexión\ de\ Cámara.desktop


    # echo "Para que el programa pueda funcionar correctamente:"
    # echo "      - Ponga en autoejecutar al inicio este script:"
    # echo "     $HOME/script/Camara_Autorun.sh"


}


function MENU {

    clear
    
    for number in {0..10}; do
        echo ""
    done
    
    echo "" ; echo ""
    read -p "Desea Instalar La Aplicacion de Gestion de las Camaras Web? (S/N)>  " respuesta
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




