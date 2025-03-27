#!/bin/bash

LOG_FILE="system_health.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
echo "===== System Health Check =====" | tee -a "$LOG_FILE"
date | tee -a "$LOG_FILE"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_INT=${CPU_USAGE%.*}  # Convert to integer
if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "WARNING: High CPU Usage - $CPU_USAGE%" | tee -a "$LOG_FILE"
fi
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
MEM_INT=${MEM_USAGE%.*}  # Convert to integer
if [ "$MEM_INT" -gt "$MEM_THRESHOLD" ]; then
    echo "WARNING: High Memory Usage - $MEM_USAGE%" | tee -a "$LOG_FILE"
fi
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//g')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "WARNING: High Disk Usage - $DISK_USAGE%" | tee -a "$LOG_FILE"
fi
PROCESS_COUNT=$(ps aux | wc -l)
echo "Total Running Processes: $PROCESS_COUNT" | tee -a "$LOG_FILE"

echo "===== Health Check Completed =====" | tee -a "$LOG_FILE"
