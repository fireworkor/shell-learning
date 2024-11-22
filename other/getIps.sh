#!/bin/bash

# 获取TCP连接的客户端IP地址
tcp_connections=$(ss -tn | awk '{print $5}'  | awk -F: '{print $4}'|sed -e 's/]//g')

# 获取UDP连接的客户端IP地址
udp_connections=$(ss -un | awk '{print $5}'  | awk -F: '{print $4}'|sed -e 's/]//g')

# 合并TCP和UDP连接的IP地址
all_connections="$tcp_connections $udp_connections"

# 去除重复项并排序
unique_ips=$(echo "$all_connections" | tr ' ' '\n' | sort | uniq)

# 将IP地址写入到connected_ips.txt文件中
echo "$unique_ips" > connected_ips.txt
