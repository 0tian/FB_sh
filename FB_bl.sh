#!/bin/bash

echo "域名路径"
echo $1

echo "清空whatweb.log"
>$work'whatweb.log'

echo "清空whatweb 200"
>$work'whatweb200.log'

echo "清空dirsearch.log"
>$work'dirsearch.log'
work=`echo $1|awk -F "/" '{$NF="";print($0)}' | tr " " "/"`
echo $work    ##文件输出路径
whatweb -i $1 --no-errors  --log-brief=$work'whatweb.log'

cat $work'whatweb.log'|grep 200|awk '{print($1)}'|awk -F "//" '{print($2)}'>$work'whatweb200.log'


cat $work'whatweb200.log' |while read line
do
	cd /root/桌面/工具/dirsearch
	python3 dirsearch.py  -u $line -e * -w /root/桌面/工具/dirsearch/dic.txt --plain-text-report=$work'dirsearch.log'
	
done

