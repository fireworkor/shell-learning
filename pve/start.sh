cd $(dirname $0)
pid=$(pgrep npc)
if [ -z "$pid" ]; then
    # nohup ./npc -server=www.baidu.com:8888 vkey=8rehr93fwurfj04j -type=tcp >/dev/null 2>&1 &
    nohup /root/npc -config /root/conf/npc.conf >/dev/null 2>&1 &
fi
