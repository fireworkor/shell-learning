#!/bin/bash

# 配置信息
PROGRAMS=("program1" "program2")
LOG_DIR="/your/log/directory"
LOG_KEYWORDS=("over")
DB_HOST="your_mysql_host"
DB_USER="your_mysql_user"
DB_PASS="your_mysql_password"
DB_NAME="your_mysql_database"

# 检查进程是否存在的函数
check_process() {
    for program in "${PROGRAMS[@]}"
    do
        pid=$(pgrep "$program")
        if [ -z "$pid" ]; then
            echo "$program 进程不存在，尝试拉起..."
            start_program "$program"
        fi
    done
}

# 启动进程的钩子函数
start_program() {
    # 在此处添加启动指定程序的逻辑
    echo "启动 $1 程序的逻辑"
}

# 检查日志的函数
check_log() {
    for keyword in "${LOG_KEYWORDS[@]}"
    do
        if grep -q "$keyword" "$LOG_DIR"/*.log; then
            echo "在日志中发现关键字: $keyword"
            insert_to_mysql "$keyword"
        fi
    done
}

# 向 MySQL 插入记录的函数
insert_to_mysql() {
    keyword="$1"
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "INSERT INTO your_table (keyword) VALUES ('$keyword')"
}

# 主循环
while true
do
    check_process
    check_log
    sleep 300
done