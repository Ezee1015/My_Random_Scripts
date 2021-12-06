#!/bin/bash

DIRECCION_DE_LA_CAMARA_DE_VIDEO="/dev/video0" # Cambiarla según la direccion de la Camara. Se puede averiguar con vlc


if [ -e "$DIRECCION_DE_LA_CAMARA_DE_VIDEO" ]; then
        #Si la cámara está activada,    DESACTIVARLA
    sudo modprobe -r uvcvideo
    notify-send -t 1000 -i camera "Cámara Desconectada" "Se ha Desconectado la Cámara"
    echo "CameraStatus=Off" > ~/.script/Data_Temp_Scripts/CameraWeb.config
    echo "[Desktop Entry]" > ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Version=1.0" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Type=Application" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Name=Activar la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Comment=Activa/Desactiva la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Exec=bash ~/.script/Camara_Web.sh" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Icon=camera" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Path=" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "Terminal=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    echo "StartupNotify=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
    chmod +x ~/Escritorio/Conexión\ de\ Cámara.desktop

else
        #Si la cámara está desactivada,    ACTIVARLA
    sudo modprobe -a uvcvideo
    notify-send -t 1000 -i camera "Cámara Conectada" "Se ha Conectado la Cámara"
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
fi
