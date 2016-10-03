#!/bin/bash
if [ ! $1 ];then
	read -p "Please enter first part of link" part1
else
	part1=$1
fi
if [ ! $2 ];then
	read -p "How much part do we got?" allParts
else
	allParts=$2
fi
if [ $allParts -gt 9 ];then
	part1=`echo $part1|sed 's|part01.rar|part|'`
else 
	part1=`echo $part1|sed 's|part1.rar|part|'`
fi
file_name=${part1##*[/]}
file_name=${file_name##*[=]}
file_name=${file_name%.*}
file_name=`echo $file_name | sed -e 's/_p30download.com//g'`
folder_name=`echo $file_name | sed -e 's/\.//g'`
#echo $file_name
#echo $folder_name
touch $folder_name.sh
for number in `seq -w 1 $allParts`;do
	echo -e "aria2c -x 16 "$part1$number.rar"\n" >> $folder_name.sh 
done