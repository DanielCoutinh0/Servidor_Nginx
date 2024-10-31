#Fora do Script
1. Criar um diretorio no /var/log/
rmdir nginx_validacao

2. Criar o arquivo de validação
sudo nano /usr/local/bin/validar_servidor.sh

#Dentro do Script
3. Arquivos de saída para online e offline
DIRETORIO_ONLINE="/var/log/nginx_validacao/nginx_online.log"
LOG_OFFLINE="/var/log/nginx_validacao/nginx_offline.log"

4. Data e Hora
DATA_HORA_ATUAL=$(date +'%Y-%m-%d %H:%M:%S')

5. Nome serviço
NOME_SERVICO="Nginx"

6. Status
STATUS_ONLINE="ONLINE"
STATUS_OFFLINE="OFFLINE"

7. Validar se o Nginx está rodando
if systemctl is-active --quiet nginx; then
    echo "$DATA_HORA_ATUAL - Serviço: $_NOME_SERVICO - Status: $STATUS_ONLINE - O servidor esta rodando." tee -a "$DIRETORIO_ONLINE" > /dev/null
else
    echo "$DATA_HORA_ATUAL - Serviço: $NOME_SERVICO - Status: $STATUS_OFFLINE - O servidor esta parado ou com problemas ." tee -a "$DIRETORIO_OFFLINE" > /dev/null
fi
