#!/bin/bash
VERDE='\033[0;32m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

#############################################################################
#DISPOSITIVO A COPIAR                                                     ###
    DISPOSITIVO="CELULAR"                                                 ###
    #DISPOSITIVO="USB"                                                    ###
                                                                          ###
USB="/media/leonardo/MEMO MEDIA/"                                         ###
ID_CELU="Google Inc."                                                     ###   Se puede conseguir con lsusb
MONTAJE="/home/$USER/Moto G20"                                            ###   Nombre Inventado. La Carpeta se creeará cuando se ejecute y se eliminara cuando termine
CEL_DIR="$MONTAJE/Tarjeta SD de SanDisk"                                  ###   Unidad de Almacenamiento donde esta la carpeta a Copiar
CELU_ORIGEN="$CEL_DIR/Informática/"                                       ###   Carpeta en Cuestion a Copiar
DESTINO="/home/$USER/Documentos/USB Informática/"                         ###   Carpeta donde Se copiará (Destino)
#############################################################################

function USB {
#   ENCONTRAR DISPOSITIVO
    if [ -d "$ORIGEN" ]; then
        COPIA
    else
        #   SI NO SE ENCONTRÓ LA CARPETA DE LA USB
        clear
        echo "NO SE HA ENCONTRADO LA CARPETA EN LA USB."
        echo "POR FAVOR, CONECTE Y MONTE LA MISMA EN EL SISTEMA DE ARCHIVOS."
        echo
        read LISTO
        USB
    fi
}

function CONECTAR {
CONECTADO=$(lsusb | grep "$ID_CELU")

if [ "$CONECTADO" = "" ] ; then
        #VERIFICA QUE ESTÉ ENCHUFADO Y DESBLOQUEADO
    clear
    echo "CONECTE EL CELULAR, E INGRESE LA CONTRASEÑA EN EL MISMO..."
    echo "          O DESCONECTE EL CELULAR Y VUELVA A CONECTARLO..."
    sleep 1
    clear
    CONECTAR
        #REPITE ACCION
else
        #PROCEDE A MONTAR EL DISPOSITIVO
    MONTAR
fi
}

function MONTAR {
if [ -d "$MONTAJE" ]; then
        #MONTA EL CELULAR EN LA CARPETA DEL SISTEMA DE ARCHIVOS DE LINUX
    jmtpfs "$MONTAJE"
    clear
    LEER
else
        #CREA UNA CARPETA Y MONTA EL CELULAR EN LA CARPETA DEL SISTEMA DE ARCHIVOS DE LINUX
    mkdir "$MONTAJE"
    jmtpfs "$MONTAJE"
    clear
    LEER
fi
}

function LEER {
if [ -d "$ORIGEN" ]; then
        #VERIFICA QUE SEA ACCESIBLE AL SISTEMA
        #SI ASI LO ES, LO DERIBA DIRECTO AL RSYNC
    clear
    echo
    echo
    echo "          Leyendo Datos del Celular..."
    COPIA
else
        #SI NO LO ENCUENTRA, DESMONTA PARA EVITAR ERRORES EN EL SISTEMA DE ARCHIVOS Y REITERA OPERACION DESDE EL PRINCIPIO
    fusermount -u "$MONTAJE"
    clear
    echo
    echo "POR FAVOR PERMITA EL INGRESO AL SISTEMA DE ARCHIVOS DEL CELULAR COMO MTP"
    sleep 1
    echo ""
    echo ""
    CONECTAR
fi
}


function COPIA {
        rsync -arvhn --delete "$ORIGEN" "$DESTINO" > ~/CambiosRsync.txt

        GUARDAR=$(head --lines="-2" ~/CambiosRsync.txt) && echo "$GUARDAR" > ~/CambiosRsync.txt && GUARDAR=$(tail --lines="+2" ~/CambiosRsync.txt) && echo "$GUARDAR" > ~/CambiosRsync.txt
        CAMBIOS=$(cat ~/CambiosRsync.txt)

        clear
        echo "Se van a Realizar los Siguientes Cambios:"
        echo
        echo -e "………………………………………………………………………………………………………………………………………………………………………………………${CYAN}"
        echo "$CAMBIOS"
        echo -e "${NC}………………………………………………………………………………………………………………………………………………………………………………………"
        echo
        echo Presione Enter para Continuar...
        read RESPUESTA
        rm ~/CambiosRsync.txt
        clear
        rsync -arvh --delete "$ORIGEN" "$DESTINO"
        echo
        echo -e "              ${VERDE}*****************************"
        echo -e "              | COPIA REALIZADA CON ÉXITO |"
        echo -e "              *****************************${NC}"
        echo
        echo
        echo
        echo
        echo
        echo
        echo
        echo
        echo
        read TERMINAR
        clear

}


if [ $DISPOSITIVO = USB ]; then
    ORIGEN="$USB"
    USB
    exit 0
else
        #DESMONTA POR SI LAS DUDAS, DESMONTA AL FINAL PARA FINALIZAR, ELIMINA LA CARPETA Y SALE
    fusermount -u "$MONTAJE"
    ORIGEN="$CELU_ORIGEN"
    clear
    CONECTAR
    fusermount -u "$MONTAJE"
    rmdir ~/Moto\ G3
    exit 0
fi
