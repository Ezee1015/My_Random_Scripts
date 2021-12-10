#Actualizar script Cámara
cd ~/script/Data_Temp_Scripts/
if [ -e CameraWeb.config ]; then
    STATUS=$(cat ~/script/Data_Temp_Scripts/CameraWeb.config | grep CameraStatus) 
    if [ "$STATUS" = "CameraStaus=On" ]; then
        #CAMARA ENCENDIDA

        sudo modprobe -a uvcvideo
        echo "[Desktop Entry]" > ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Version=1.0" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Type=Application" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Name=Desactivar la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Comment=Activa/Desactiva la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Exec=bash ~/script/Camara_Web.sh" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Icon=camera" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Path=" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Terminal=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "StartupNotify=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        chmod +x ~/Escritorio/Conexión\ de\ Cámara.desktop

    else
        #CAMARA APAGADA

        sudo modprobe -r uvcvideo
        echo "[Desktop Entry]" > ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Version=1.0" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Type=Application" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Name=Activar la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Comment=Activa/Desactiva la Cámara" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Exec=bash ~/script/Camara_Web.sh" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Icon=camera" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Path=" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "Terminal=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        echo "StartupNotify=true" >> ~/Escritorio/Conexión\ de\ Cámara.desktop
        chmod +x ~/Escritorio/Conexión\ de\ Cámara.desktop

    fi
fi

exit 0
