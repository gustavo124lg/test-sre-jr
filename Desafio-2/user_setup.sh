#!/bin/bash

#Criação do Usuario devops_user
useradd devops_user

#Configurando Diretorio
mkdir -p /home/devops_user/restricted_data/
chown devops_user:devops_user /home/devops_user/restricted_data/
chmod 700 /home/devops_user/restricted_data/

#Configurando o SSH
usermod -aG sudo devops_user
mkdir -p /home/devops_user/.ssh
touch /home/devops_user/.ssh/authorized_keys
chown -R devops_user:devops_user /home/devops_user/.ssh
chmod 700 /home/devops_user/.ssh
chmod 600 /home/devops_user/.ssh/authorized_keys

#Adicionando chave ssh no authorized_keys
echo "ssh-rsa INSIRA SUA CHAVE AQUI"> /home/devops_user/.ssh/authorized_keys

echo -e "\n-----------------------------------------------\n"
echo "Usuário devops_user criado com sucesso!"
