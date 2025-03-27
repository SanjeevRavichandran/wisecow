#!/bin/bash

LOG_FILE="access.log" 

echo "===== Log Analysis Summary ====="
echo "Total 404 Errors:"
grep " 404 " "$LOG_FILE" | wc -l

echo -e "\nTop 5 Requested Pages:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo -e "\nTop 5 Requesting IPs:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5



RUN THE SCRIPT
chmod +x log_analyzer.sh
./log_analyzer.sh
