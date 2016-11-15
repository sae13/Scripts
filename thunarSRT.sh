#!/bin/bash
fullPATH=$1
encode=`file -ib $fullPATH|cut -d= -f 2`
if [ $encode=='unknown-8bit' ];then
	encode="WINDOWS-1256"
fi
fromFILE=$fullPATH
fromFILEwithNOextention=`echo $fromFILE|cut -d. -f -1`
backupFILE=`echo $fromFILEwithNOextention".bak.srt"`
mv  $fromFILE $backupFILE
iconv $backupFILE -f $encode -t UTF-8 > $fromFILE
