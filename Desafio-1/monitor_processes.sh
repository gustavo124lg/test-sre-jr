#!/bin/bash

# Data e hora atual
DATE=$(date '+%d/%m/%Y %H:%M:%S')

# Arquivo de log
LOG_FILE="$HOME/process_monitor.log"

# Cabeçalho
echo "======== Relatório de Processos - $DATE ========" >> $LOG_FILE

# Top 5 CPU
echo -e "\n## TOP 5 - CPU ##" >> $LOG_FILE
ps aux --sort=-%cpu | head -6 | tail -5 >> $LOG_FILE

# Top 5 Memória
echo -e "\n## TOP 5 - MEMÓRIA ##" >> $LOG_FILE
ps aux --sort=-%mem | head -6 | tail -5 >> $LOG_FILE

echo -e "\n-----------------------------------------------\n" >> $LOG_FILE