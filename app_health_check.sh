#!/bin/bash
URL="172.31.8.146:7000"
LOG_FILE="app_health.log"
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
if [ "$STATUS_CODE" -eq 200 ]; then
    echo "[$TIMESTAMP] Application is UP (Status: $STATUS_CODE)" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] ALERT: Application is DOWN (Status: $STATUS_CODE)" | tee -a "$LOG_FILE"
fi



RUN THE SCRIPT
chmod +x app_health_check.sh
./app_health_check.sh
