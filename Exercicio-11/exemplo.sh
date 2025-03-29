#!/bin/bash

# Exemplo de comando if

# Verifica se o arquivo /etc/passwd existe  
if [ -e /etc/passwd ]; then
    echo "O arquivo /etc/passwd existe"
else
    echo "O arquivo /etc/passwd não existe"
fi

# Exemplo de comando case

# Verifica o qual opção vc escolheu

echo "Escolha uma opção:"
read opcao
case $opcao in
    1) echo "Você escolheu a opção 1";;
    2) echo "Você escolheu a opção 2";;
    3) echo "Você escolheu a opção 3";;
    *) echo "Opção inválida";;
esac

#Exemplo de comando while

# Contador de 0 a 5
contador=0
while [ $contador -le 4 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
    sleep 1
done