#!/bin/bash
# https://www.howtogeek.com/813741/linux-arping-command/

for ((device=$1; device<=$2; device++))
do

	arping -c 1 192.168.1.$device | grep -E "1 response|1 packets received" > /dev/null

	if [ $? == 0 ]; then
		echo "192.168.1.$device responded."      
	else
		echo "192.168.1.$device didn't respond."
	fi
done
