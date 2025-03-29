# Setup User

## Passo a Passo

1 - Necessario dar a permissão de execução ao script par isso use o comando: 
    "chmod +x user_setup.sh"

2 - Configurações do Diretorio
    mkdir -p /home/devops_user/restricted_data/         --->        Cria o diretorio
    chown devops_user:devops_user /home/devops_user/restricted_data/        --->       Adiciona o grupo e user ao diretorio
    chmod 700 /home/devops_user/restricted_data/        --->  Configura as permissões de acesso apenas o proprietário (devops_user)

3 - Configurações do SSH
    usermod -aG sudo devops_user         --->       Adiciona o usuário devops_user ao grupo sudo
    mkdir -p /home/devops_user/.ssh         --->    Cria o diretório .ssh
    touch /home/devops_user/.ssh/authorized_keys         --->   Cria o arquivo authorized_keys
    chown -R devops_user:devops_user /home/devops_user/.ssh         --->    Adiciona o grupo e user ao diretorio
    chmod 700 /home/devops_user/.ssh         ---> Configura as permissões de acesso apenas o proprietário (devops_user)
    chmod 600 /home/devops_user/.ssh/authorized_keys         ---> Define permissões do arquivo authorized_keys (apenas leitura e escrita pelo proprietário)

4 - Adicionando SSH no script
    echo "ssh-rsa INSIRA SUA CHAVE AQUI"> /home/devops_user/.ssh/authorized_keys ---> Adiciona a chave pública SSH ao arquivo authorized_keys



### Explicações:

1. **Passo 1:** `chmod +x` dá permissão de execução ao script.

2. **Passo 2:** Criação do diretório `restricted_data` e configuração das permissões para que apenas o usuário `devops_user` tenha acesso a ele.
mkdir -p /home/devops_user/restricted_data/           # Cria o diretório
chown devops_user:devops_user /home/devops_user/restricted_data/   # Adiciona o grupo e usuário ao diretório
chmod 700 /home/devops_user/restricted_data/           # Configura as permissões de acesso apenas para o proprietário (devops_user)

3. **Passo 3:** Configuração de SSH, onde o usuário é adicionado ao grupo `sudo` e as permissões de acesso ao diretório `.ssh` são configuradas corretamente para maior segurança.
usermod -aG sudo devops_user                           # Adiciona o usuário devops_user ao grupo sudo
mkdir -p /home/devops_user/.ssh                        # Cria o diretório .ssh
touch /home/devops_user/.ssh/authorized_keys          # Cria o arquivo authorized_keys
chown -R devops_user:devops_user /home/devops_user/.ssh   # Adiciona o grupo e usuário ao diretório .ssh
chmod 700 /home/devops_user/.ssh                      # Configura as permissões de acesso apenas para o proprietário (devops_user)
chmod 600 /home/devops_user/.ssh/authorized_keys     # Define permissões do arquivo authorized_keys (somente leitura e escrita pelo proprietário)

4. **Passo 4:** O script adiciona a chave pública SSH ao arquivo `authorized_keys`, permitindo que o usuário se conecte via SSH.
echo "ssh-rsa INSIRA SUA CHAVE AQUI" > /home/devops_user/.ssh/authorized_keys  # Adiciona a chave pública SSH ao arquivo authorized_keys

Essa estrutura em Markdown melhora a legibilidade e a organização do seu texto, tornando-o mais claro e fácil de seguir.
