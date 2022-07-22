#!/bin/bash

TIEMPO_CORTE=29

args=("$@")
for (( x=0; x<$#; x++ )); do
    if [[ ${args[$x]} = "-t" ]]; then
        TIEMPO_CORTE=${args[$(expr $x + 1)]}
        x=$(expr $x + 1)
    else if [[ ${args[$x]} = "-h" ]]; then
        echo ""
        echo "Script para recortar videos cada cierto tiempo."
        echo ""
        echo " ./porcionador.sh [-h] [-t xx] [-e xxx] [Archivo 1] [Archivo 2] [Archivo 3] ..."
        echo ""
        echo "  -h --> Imprimir ayuda en pantalla"
        echo "  -t --> Especifica el tiempo de cada corte. Default: 29s"
        echo ""
        exit
    else if [[ -f ${args[$x]} ]]; then
        RUTA=${args[$x]}
        ARCHIVO=${RUTA##*/}             # elimina todo hasta la última /
        NOMBRE=${ARCHIVO%.*}            # elimina todo desde el último punto
        DURACION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$RUTA")
        DURACION=${DURACION%.*}
        i=0;
        while [[ $(expr $i \* $TIEMPO_CORTE) -lt $DURACION ]] ; do
            ARCHIVO_FINAL="$NOMBRE - Parte $(expr $i + 1).${ARCHIVO##*.}"
            ffmpeg -ss $(expr $i \* $TIEMPO_CORTE) -i "$RUTA" -t $TIEMPO_CORTE -c:v copy -c:a copy "$ARCHIVO_FINAL"
            echo "ffmpeg -ss $(expr $i \* $TIEMPO_CORTE) -i "$RUTA" -t $TIEMPO_CORTE -c:v copy -c:a copy "$ARCHIVO_FINAL""
            i=$(expr $i + 1)
        done
    fi
    fi
    fi
done
