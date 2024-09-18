#!/bin/bash

# 日志文件路径
LOG_FILE=/var/log/resource_usage.log

# 阈值
CPU_THRESHOLD=80
MEM_THRESHOLD=90
DISK_THRESHOLD=95

# 最近12次监控数据的数量
NUM_LAST_RECORDS=12

# 发送电子邮件的命令
EMAIL_CMD="mail -s \"Resource Usage Alert\" admin@example.com"

# 获取当前资源使用率
CPU_USAGE=$(vmstat 1 2 | tail -1 | awk '{print $15}')
MEM_USAGE=$(free -m | awk 'NR==2{printf "%d\n", $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2{printf "%d\n", $5}')

# 记录监控数据
echo "$(date +%Y-%m-%d\ %H:%M:%S) CPU: $CPU_USAGE%, MEM: $MEM_USAGE%, DISK: $DISK_USAGE%" >> $LOG_FILE

# 检查资源使用率是否超过阈值
if [[ $CPU_USAGE -gt $CPU_THRESHOLD || $MEM_USAGE -gt $MEM_THRESHOLD || $DISK_USAGE -gt $DISK_THRESHOLD ]]; then
    echo "Resource usage above threshold: CPU: $CPU_USAGE%, MEM: $MEM_USAGE%, DISK: $DISK_USAGE%" >> $LOG_FILE
fi

# 获取最近12次监控数据
LAST_RECORDS=$(tail -$NUM_LAST_RECORDS $LOG_FILE)

# 检查资源使用率是否持续超过阈值超过3次
COUNT_CPU=0
COUNT_MEM=0
COUNT_DISK=0
for record in $LAST_RECORDS; do
    if [[ $record =~ "CPU: [0-9]+%" ]]; then
        cpu=$(echo $record | awk '{print $2}')
        [[ $cpu -gt $CPU_THRESHOLD ]] && ((COUNT_CPU++))
    elif [[ $record =~ "MEM: [0-9]+%" ]]; then
        mem=$(echo $record | awk '{print $2}')
        [[ $mem -gt $MEM_THRESHOLD ]] && ((COUNT_MEM++))
    elif [[ $record =~ "DISK: [0-9]+%" ]]; then
        disk=$(echo $record | awk '{print $2}')
        [[ $disk -gt $DISK_THRESHOLD ]] && ((COUNT_DISK++))
    fi
done

# 如果资源使用率持续超过阈值超过3次，则发送电子邮件通知
if [[ $COUNT_CPU -gt 3 || $COUNT_MEM -gt 3 || $COUNT_DISK -gt 3 ]]; then
    echo "Resource usage persistently above threshold for more than 3 times: CPU: $COUNT_CPU, MEM: $COUNT_MEM, DISK: $COUNT_DISK" >> $LOG_FILE
    $EMAIL_CMD < $LOG_FILE
fi