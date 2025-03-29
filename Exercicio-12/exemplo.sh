#! /bin/bash

#Exemplo de utilização dos argumento $1, $@ e $#

echo "O primeiro argumento é: $1"
echo "Todos os argumentos são: $@"
echo "O número de argumentos é: $#"

# Loop para imprimir todos os argumentos
# Para checar o funcionamento rode o script ./exemplo.sh arg1 arg2 "arg3"
for arg in "$@"; do
    echo "Argumento: $arg"
done