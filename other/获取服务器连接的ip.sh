#!/bin/bash

# 使用tcpdump捕获eth0接口的数据包，并将输出保存到tcpdump.log文件
timeout 5 tcpdump -i eth0 -nn -tttt > tcpdump.log

cat tcpdump.log |sed -e 's/^.*IP//g' |sed -e 's/: Flags.*//g' >ipFlow.txt

cat ipFlow.txt |awk -F '.' '{print $1"."$2"."$3"."$4}' |sort -u|grep -v ARP |grep -v '\.\.\.' >ips.txt

# 提取tcpdump.log文件中的IP地址，并去除重复项
ips=$(cat tcpdump.log |sed -e 's/^.*IP//g' |sed -e 's/: Flags.*//g'|awk -F '.' '{print $1"."$2"."$3"."$4}' |sort -u |grep -v ARP |grep -v '\.\.\.' )

# 输出提取到的IP地址
echo "通过eth0接口的所有进出IP地址如下："
echo "$ips"

# 可选择删除临时生成的tcpdump.log文件
# rm tcpdump.log
