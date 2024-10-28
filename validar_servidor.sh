#Fora do Script
1. Criar o arquivo de validação
sudo nano /usr/local/bin/validar_nginx_status.sh

#Dentro do Script
2. Diretorio para salvar os logs
LOG_DIR="/var/log/nginx_validation"

3. Arquivos de saída para online e offline
LOG_ONLINE="$LOG_DIR/nginx_online.log"
LOG_OFFLINE="$LOG_DIR/nginx_offline.log"

4. Verificar se o diretório de logs existe, se não, cria
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

5. Data e Hora
DATA_HORA=$(date +'%Y-%m-%d %H:%M:%S')

6. Nome serviço
SERVICO="Nginx"

7. Validar se o Nginx está rodando
if systemctl is-active --quiet nginx; then
    echo "$DATA_HORA - Serviço: $SERVICO - Status: ONLINE - O servidor esta rodando." >> "$LOG_ONLINE"
else
    echo "$DATA_HORA - Serviço: $SERVICO - Status: OFFLINE - O servidor esta parado ou com problemas ." >> "$LOG_OFFLINE"
fi
