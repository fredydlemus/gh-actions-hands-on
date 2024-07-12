#!/bin/bash

SERVICES=("nginx" "mysql" "ssh")

check_service() {
  SERVICE=$1
  if systemctl list-units --full -all | grep -Fq "$SERVICE.service"; then
    if systemctl is-active --quiet $SERVICE; then
      echo "$SERVICE está corriendo."
    else
      echo "$SERVICE no está corriendo. Reiniciando..."
      systemctl start $SERVICE
      if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE se ha reiniciado correctamente."
      else
        echo "No se pudo reiniciar $SERVICE."
      fi
    fi
  else
    echo "El servicio $SERVICE no está instalado en este sistema."
  fi
}

for SERVICE in "${SERVICES[@]}"; do
  check_service $SERVICE
done