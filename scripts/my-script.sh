#!/bin/bash

THRESHOLD=80

DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

EMAIL="tu_correo@dominio.com"

if [ $DISK_USAGE -gt $THRESHOLD ]; then
  echo "El uso del disco ha superado el $THRESHOLD%. Uso actual: $DISK_USAGE%" | mail -s "Alerta de Espacio en Disco" $EMAIL
fi