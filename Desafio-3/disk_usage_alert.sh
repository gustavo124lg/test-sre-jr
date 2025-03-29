#!/bin/bash

DISK="/"
DISK_LIMIT=80
LOG_FILE="disk_alert.log"

# Verifica o uso do disco
DISK_USO=$(df -h "$DISK" | awk 'NR==2 {print $5}' | sed 's/%//')

# Horario
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Verifica se o uso do disco está acima do limite
if [ "$DISK_USO" -gt "$DISK_LIMIT" ]; then
echo "$TIMESTAMP - ALERTA: Uso do disco em $DISK acima de $DISK_LIMIT% ($DISK_USO%)" >> "$LOG_FILE"
echo "ALERTA: Uso do disco em $DISK acima de $DISK_LIMIT% ($DISK_USO%)"
else
echo "$TIMESTAMP - CHECK: Uso do disco em $DISK está abaixo de $DISK_LIMIT% ($DISK_USO%)" >> "$LOG_FILE"
echo "INFO: Uso do disco em $DISK está abaixo de $DISK_LIMIT% ($DISK_USO%)"
fi