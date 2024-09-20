#!/bin/bash

# 定义函数来获取系统信息
get_ip() {
    ip addr | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d '/' -f 1
}

get_linux_version() {
    if [ -f /bin/systemctl ] ; then 
        cat /etc/os-release | grep -w "VERSION_ID" | awk -F '"' '{print $2}'
    else
        cat /etc/issue|awk 'NR==1{print $7}'
    fi
}

get_cpu_usage() {
    echo `top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'`%
}

get_memory_usage() {
    free -m | awk 'NR==2{printf "%.2f%%", ($3/$2)*100 }'
}

check_disk_usage() {
    disk_usage=$(df -h / | tail -1 | awk '{print $5}' | cut -d '%' -f1)
    if [ $disk_usage -gt 95 ]; then echo "Yes"; else echo "No"; fi
}

get_io_status() {
    if [ -f /usr/bin/iostat ] | [ -f /bin/iostat ] ;then 
        echo `iostat | awk 'NR==4{print $6}'`%
    else 
        echo "N/A"
    fi
}

get_load_average() {
    uptime | awk -F'load average: ' '{print $2}'| tr "," "|"
}

check_ssh_process() {
    sshdTmp=$(ps -ef | grep sshd | grep -v grep | wc -l)
    if [ $sshdTmp -ge 1 ]; then
        echo "on"
    else
        echo "off"
    fi
}

check_firewall_process() {
    firewallTmp="0"
    if [ -f /etc/init.d/iptables ]; then
        firewallTmp=`/etc/init.d/iptables status | grep "is running" | wc -l`
        
    elif [ -f /etc/init.d/firewalld ]; then
        firewallTmp=`systemctl is-active firewalld | grep "active" | wc -l`
    else
       cd .
    fi
    if [ $firewallTmp -ge 1 ]; then
        echo "on"
    else
        echo "off"
    fi
}

check_ftp_process() {
    ftpdTmp=`ps -ef | grep ftpd |grep -v grep| wc -l`
    if [ $ftpdTmp -eq 1 ]; then
      echo "on"
    else
      echo "off"
    fi
}

check_nfs_process() {
    nfsTmp=`ps -ef | grep nfsd |grep -v grep| wc -l`
    if [ $nfsTmp -eq 1 ]; then
      echo "on"
    else
      echo "off"
    fi
}

check_oracle_process() {
    smon=`ps -ef | grep smon | grep -v grep | wc -l`
    pmon=`ps -ef | grep pmon | grep -v grep | wc -l`
    ckpt=`ps -ef | grep ckpt | grep -v grep | wc -l`
    lgwr=`ps -ef | grep lgwr | grep -v grep | wc -l`
    reco=`ps -ef | grep reco | grep -v grep | wc -l`
    
    if [ $smon -eq 1 ] && [ $pmon -eq 1 ] && [ $ckpt -eq 1 ] && [ $lgwr -eq 1 ] && [ $reco -eq 1 ]; then
      echo "on"
    else
      echo "off"
    fi

}

get_login_users() {
    who | wc -l
}

get_system_uptime() {
    uptime_output=$(uptime)
    if [[ $uptime_output =~ up\ ([0-9]+)\ days,\ ([0-9]+):([0-9]+) ]]; then
        days=${BASH_REMATCH[1]}
        hours=${BASH_REMATCH[2]}
        echo "系统已运行 $days 天 $hours 小时"
    else
        echo "无法解析运行时间"
    fi
}

check_port1521_status() {
    port=1521
    count=`netstat -natpl|grep -w "$port" |grep LISTEN|grep tnslsnr|wc -l`
    if [ $count == "1" ]; then
        status="$status,$port:on"
    else
        status="$status,$port:off"
    fi
    echo "${status:1}"
}
check_port21_status() {
    port=21
    count=`netstat -natpl|grep -w "$port" |grep LISTEN|grep vsftpd|wc -l`
    if [ $count == "1" ]; then
        status="$status,$port:on"
    else
        status="$status,$port:off"
    fi
    echo "${status:1}"
}
check_port22_status() {
    port=22
    count=`netstat -natpl|grep -w "$port" |grep LISTEN|grep sshd|wc -l`
    if [ $count == "1" ]; then
        status="$status,$port:on"
    else
        status="$status,$port:off"
    fi
    echo "${status:1}"
}

# 获取系统信息
ip=$(get_ip)
linux_version=$(get_linux_version)
cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(check_disk_usage)
io_status=$(get_io_status)
load_average=$(get_load_average)
ssh_process=$(check_ssh_process)
firewall_process=$(check_firewall_process)
ftp_process=$(check_ftp_process)
nfs_process=$(check_nfs_process)
oracle_process=$(check_oracle_process)
login_users=$(get_login_users)
system_uptime=$(get_system_uptime)
port21_status=$(check_port21_status)
port22_status=$(check_port22_status)
port1521_status=$(check_port1521_status)


# 以 CSV 格式输出系统信息
#echo "IP地址,Linux 版本检测,CPU 使用率,内存使用率,硬盘是否有超过百分之 95 的,IO 状态,负载情况,SSH 进程运行情况,防火墙进程运行情况,FTP 进程运行情况,NFS 进程运行情况,Oracle 进程运行情况,系统登录人数,系统运行时间,21端口,22端口,1521端口" | iconv -f UTF-8 -t GBK >>sysInfo.csv
#echo "$ip,$linux_version,$cpu_usage,$memory_usage,$disk_usage,$io_status,$load_average,$ssh_process,$firewall_process,$ftp_process,$nfs_process,$oracle_process,$login_users,$system_uptime,$port_status"| iconv -f UTF-8 -t GBK >>sysInfo.csv

echo "IP地址,Linux 版本检测,CPU 使用率,内存使用率,硬盘是否有超过百分之 95 的,IO 状态,负载情况,SSH 进程运行情况,防火墙进程运行情况,FTP 进程运行情况,NFS 进程运行情况,Oracle 进程运行情况,系统登录人数,系统运行时间,21端口,22端口,1521端口"  >>sysInfo.csv
echo "$ip,$linux_version,$cpu_usage,$memory_usage,$disk_usage,$io_status,$load_average,$ssh_process,$firewall_process,$ftp_process,$nfs_process,$oracle_process,$login_users,$system_uptime,$port21_status,$port22_status,$port1521_status" >>sysInfo.csv