#!/bin/bash

######################
FORMATO=12           #
#FORMATO=24          #
######################

while TRUE ; do
    #ACTUALIZA LA FECHA
    SEGUNDOS=$(date +%S)
    MINUTOS=$(date +%M)
    HORA=$(date +%H)
    
    #COMPRUEBA QUE SEA LA HORA "EN PUNTO"
    if [ $SEGUNDOS -eq "00" ]; then
    
        #ACCIONAMIENTO DEL COMPROBADOR DE HORA EXACTA
               if [ $MINUTOS -eq "00" ]; then
                        
                    ##SI SUPERO EL NUMERO AL FORMATO, LO FORMATEA CORRECTAMENTE
                    #if [ $FORMATO -eq 12 && $HORA -ge "12" ]; then
                    #    HORA=`expr $HORA - 12`
                    #fi
               
                    #ACCIONAMIENTO DE TALKIE-CLOCK
                    case $HORA in
                    
                        "00")
                            ARCHIVO="12"
                        ;;
                        
                        "1")
                            ARCHIVO="01"
                        ;;
                        
                        "2")
                            ARCHIVO="02"
                        ;;
                        
                        "3")
                            ARCHIVO="04"
                        ;;
                        
                        "5")
                            ARCHIVO="05"
                        ;;
                        
                        "6")
                            ARCHIVO="06"
                        ;;
                        
                        "7")
                            ARCHIVO="07"
                        ;;
                        
                        "8")
                            ARCHIVO="08"
                        ;;
                        
                        "9")
                            ARCHIVO="09"
                        ;;
                        
                        "10")
                            ARCHIVO="10"
                        ;;
                        
                        "11")
                            ARCHIVO="11"
                        ;;
                        
                        "12")
                            ARCHIVO="12"
                        ;;
                        
                        "13")
                            ARCHIVO="13"
                        ;;
                        
                        "14")
                            ARCHIVO="14"
                        ;;
                        
                        "15")
                            ARCHIVO="15"
                        ;;
                        
                        "16")
                            ARCHIVO="16"
                        ;;
                        
                        "17")
                            ARCHIVO="17"
                        ;;
                        
                        "18")
                            ARCHIVO="18"
                        ;;
                        
                        "19")
                            ARCHIVO="19"
                        ;;
                        
                        "20")
                            ARCHIVO="20"
                        ;;
                        
                        "21")
                            ARCHIVO="21"
                        ;;
                        
                        "22")
                            ARCHIVO="22"
                        ;;
                        
                        "23")
                            ARCHIVO="23"
                        ;;
                        
                        "24")
                            ARCHIVO="24"
                        ;;
                        
                        esac
                                   
                        #CONFIGURA LA REPRODUCCION SONORA DEL ARCHIVO DE SONIDO CORRECTO SEGGUN EL FORMATO
                        if ( $ARCHIVO -gt $FORMATO ) ; then
                            NUMERO=$( $ARCHIVO - $FORMATO )
                        else
                            NUMERO=ARCHIVO
                        fi

                    #SUSPENSION DEL TALKIE-CLOCK
                    if [ -f ~/.script/SUSPENSIÓN_DE_TALKIE-CLOCK ]; then
                            rm ~/.script/SUSPENSIÓN_DE_TALKIE-CLOCK
                            notify-send -i ~/Imágenes/ICONOS/Talkie-Clock_Campana.png "Talkie-Clock" "Ya son las $NUMERO. Próximos avisos Activados"
                            sleep 60
                    else

                        #REPRODUCCIÓN SONORA DE LA HORA
                        play "~/Música/Talkie-Clock\ Audios/SonLas$NUMERO.mp3"
                        
                        #DESCANSO DE 58 MINUTOS
                        sleep 60
                        
                    fi
                    
                else
                
                    sleep 60
                    
                fi
                
    else
    
        #REITERA LA OPERACIÓN, DEJANDO DESCANSAR UN SEGUNDO DE POR MEDIO
        sleep 1
        
    fi
    
done

