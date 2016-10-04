#!/bin/bash
pid1=$$
echo $pid1 > /tmp/nicico.pid
while ([ True ])
do
	nmcli con up nabian  2>/dev/null
	status=$?
	echo $status
	if [ $status == "0" ];then
		jdate >/tmp/nabian.log
	fi
	sleep 60
done
