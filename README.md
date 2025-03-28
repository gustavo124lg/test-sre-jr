# test-sre-jr

# Questões teóricas
1. Informe os comandos relacionados a procesos no linux que já utilizou na prática e o porque de cada um deles
   - "ps aux", "ps aux | grep", "htop", "kill -9" e "systemctl" 
2. Explique o significado completo da seguinte saída do comando ls -l (-rwxr-x--- 1 devops users 1024 Mar 25 12:00 script.sh)
   - "-rwxr-x---" = Seriam as permissões do arquivo, "r" para leitura, "w" para escrita, "x" para execução do arquivo. E os 3 primeiros "rwx" seriam as permissões para o dono do arquivo, e os próximos "r-x" seriam para o grupo
    "devops" = Dono do arquivo 
    "users" = Grupo do arquivo
    "1024" = Tamanho do arquivo
    "Mar 25 12:00" = Data e hora da criação do arquivo
    "script.sh" =  Nome do arquivo (.sh seria a extensão indicando que o arquivo é um script )
3. Quais comandos você utiliza para avaliar possíveis problemas em cpu,memória,disco,rede em sistemas operacionais linux
    - "htop", "free -h", "df -h", "ncdu", "ping" e "telnet" 
4. Explique a diferença entre topologia física e topologia lógica de uma rede. Dê um exemplo de cada uma.
    - 
5. Quais são as principais características das topologias de rede estrela, anel e malha? Cite vantagens e desvantagens de cada uma.
    - 
6. Por que a topologia em malha é frequentemente utilizada em ambientes críticos, como data centers e infraestrutura de nuvem? Como ela contribui para a resiliência da rede?
    -
7. Explique a diferença entre EC2, S3 e RDS na AWS. Para que tipo de aplicação cada um é mais adequado?
    - EC2 = Seria os servidores em nuvem o qual você consegue criar com as caracteristicas que necessita como com foco em memoria ou CPU (conhecido como familias na AWS) e o mais adequado para ele seria suas aplicações como nginx, python e sites Web(pode ser utilizado como DB e rodar Containers mas não é o indicado)
    S3 = É um serviço de armazenamento escalavel e sua aplicação seria para guardar imagens que a aplicação vai buscar ou até mesmo a criação de backups e armazenamento de logs.
    RDS = Serviço para banco de dados relacionais. Utilizado para subir bancos de dados como MySQL e tornar ser possivel e mais simples escalar o ambiente.
8. O que é um Auto Scaling Group (ASG) e como ele funciona em conjunto com um Load Balancer (ELB) para melhorar a disponibilidade de uma aplicação?
    - O ASG possibilita o escalonamento da quantidade de instancias(EC2) e em conjunto com o Load Balancer que gerencia as requisições e manda para as EC2 o ASG escala caso aja necessidade.
9. O que são IAM Roles e IAM Policies na AWS? Qual a diferença entre uma policy gerenciada pela AWS e uma policy personalizada (custom policy)?
    - IAM Roles é um grupo criado que pode ser atribuida permissões de acesso e atividades que podem executar na AWS e IAM Policies seria onde você insere as permissões que aquele grupo vai poder acessar. As Policy gerenciada pela AWS são para atividades mais "comuns" e as custom para atividades mais especificas.  
10. O que é o shebang (#!) em um script shell? Dê um exemplo de como ele deve ser usado em um script Bash.
    - Ele é um caractere que inidica o inicio do script e qual shell ele vai utilizar. 
        Ex: #!/bin/bash
11. Explique a diferença entre os comandos if, case e while em um script shell. Dê um exemplo prático de uso para cada um.
    - 
12. Qual a diferença entre $1, $@ e $# em um Shell Script? Dê um exemplo de um script que utilize essas variáveis para manipular argumentos passados na linha de comando.
    -
13. Explique como você faria um dump de um banco de dados Mysql e quais informações precisaria para isso.
    -
14. Explique como faria o controle de acesso em um banco de dados Mysql e quais informações precisaria para essa demanda.
    -

# Questões práticas

---

## Desafio 1: Gerenciamento de Processos e Logs

### Tarefa  
- Crie um **script Bash** chamado `monitor_processes.sh` que:  
  - Liste os 5 processos que mais consomem **CPU** e os 5 que mais consomem **memória**.  
  - Registre essa informação em um arquivo de log chamado `process_monitor.log`.  
  - Faça o script rodar automaticamente a cada **5 minutos** usando o `cron`.  

### Entrega  
- Suba o script `monitor_processes.sh` no GitHub.  
- Adicione um arquivo `README.md` explicando como configurar o `cron` para rodar o script.  

---

## Desafio 2: Permissões e Segurança

### Tarefa  
- Crie um **script Bash** chamado `user_setup.sh` que:  
  - Crie um usuário chamado **devops_user**.  
  - Configure um diretório `/home/devops_user/restricted_data/` acessível **apenas pelo dono** do diretório.  
  - Adicione o usuário ao grupo `sudo` e restrinja seu acesso SSH apenas via **chave pública**.  

### Entrega  
- Suba o script `user_setup.sh` no GitHub.  
- Adicione um arquivo `README.md` explicando o que o script faz e como usá-lo.  

---

## Desafio 3: Monitoramento de Uso de Disco

### Tarefa  
- Crie um **script Bash** chamado `disk_usage_alert.sh` que:  
  - Verifique o uso do disco em **`/`**.  
  - Caso o uso esteja acima de **80%**, registre um alerta em um arquivo `disk_alert.log`.  
  - Caso o uso esteja abaixo de **80%**, registre uma mensagem informando que o disco está com espaço suficiente.  

---

## Desafio 4: Pipeline Declarativa no Jenkins para CI/CD

### Tarefa  
Crie um **Jenkinsfile** que implemente um **CI/CD** contendo os seguintes estágios:  

1. **Checkout**
2. **Build**
3. **Test**
4. **Code Quality**
5. **Package(empacotamento do artefato)**
6. **Deploy(um deploy simples em docker)**
   - Se for ambiente **não produção**, faça o deploy;
   - Se for **produção**, solicite uma autorização.

## Requisitos
- A app simples deve ser em Node.js
- Utilize pipelines declarativas
- Explique no próprio jenkinsfile caso você entenda que o time de SRE terá alguma dificuldade de entender pontos específicos
- Utilize variáveis de ambiente

---

## Desafio 5: Dockerfile e Docker Compose  

### Tarefa  
Crie um **Dockerfile** e um **docker-compose.yml** para uma aplicação simples em Node.js.

## Requisitos
1. **Dockerfile:**
   - Criar uma imagem baseada em **Alpine Linux**.
   - Instalar as dependências
   - Expor a porta necessária para rodar

2. **docker-compose.yml:**
   - Criar um serviço para a aplicação.
   - Criar um serviço de banco de dados **MySQL**
   - Configurar variáveis de ambiente para conexão ao banco de dados

3. **Execução:**
   - A aplicação deve ser iniciada corretamente com `docker-compose up -d`.

---

## Desafio 6: IaC AWS com Terraform  

### Tarefa  
Crie um projeto no Terraform que provisione a seguinte infraestrutura **AWS**

1. **Instância EC2**  
   - SO: **Amazon Linux 2**.  
   - Instalar e configurar um **nginx** para servir uma página estática com a mensagem `"Eu quero ser um Printer"`.
   - Expor a porta **80** para acesso público.

2. **Application Load Balancer (ALB)**  
   - Criar um **ALB** direcionando tráfego para a instância EC2

3. **Registro no Route 53**
   - Criar um domínio e registro fazendo apontamento para o ALB
   - O domínio pode ser simulado, sem necessidade de um domínio real
