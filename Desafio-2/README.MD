# Setup User

## Passo a Passo

1 - Necessario dar a permissão de execução ao script par isso use o comando: 
    "chmod +x user_setup.sh"

2 - Configurações do Diretorio

    `mkdir -p /home/devops_user/restricted_data/`         --->        Cria o diretorio
    `chown devops_user:devops_user /home/devops_user/restricted_data/`        --->       Adiciona o grupo e user ao diretorio
    `chmod 700 /home/devops_user/restricted_data/`        --->  Configura as permissões de acesso apenas o proprietário (devops_user)

3 - Configurações do SSH

    `usermod -aG sudo devops_user `        --->       Adiciona o usuário devops_user ao grupo sudo
    `mkdir -p /home/devops_user/.ssh`        --->    Cria o diretório .ssh
    `touch /home/devops_user/.ssh/authorized_keys`         --->   Cria o arquivo authorized_keys
    `chown -R devops_user:devops_user /home/devops_user/.ssh`         --->    Adiciona o grupo e user ao diretorio
    `chmod 700 /home/devops_user/.ssh`         ---> Configura as permissões de acesso apenas o proprietário (devops_user)
    `chmod 600 /home/devops_user/.ssh/authorized_keys`        ---> Define permissões do arquivo authorized_keys (apenas leitura e escrita pelo proprietário)

4 - Adicionando SSH no script

    `echo "ssh-rsa INSIRA SUA CHAVE AQUI"> /home/devops_user/.ssh/authorized_keys` ---> Adiciona a chave pública SSH ao arquivo authorized_keys
