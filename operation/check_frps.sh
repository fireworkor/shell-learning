#!/bin/bash
url=frps.fireworkor.top/static/
username=test
password=test2

httpCode=`/usr/bin/curl -u ${username}:${password} -o /dev/null --connect-timeout 3 -s -w "%{http_code}" ${url}`

if [ "$httpCode" == 200  ];then
        echo "frps is normal"
else 
        /usr/bin/systemctl  restart frps
fi
