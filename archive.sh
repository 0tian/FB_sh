#!/usr/bin/bash
rm -rf $1
mkdir $1
proxychains curl http://web.archive.org/cdx/search/cdx?url=*.$1/* >./$1/$1.txt
cat ./$1/$1.txt |grep -v 2019 > ./$1/$1.no2019.txt
cat ./$1/$1.txt |grep 2019|awk '{print($3,$4,$5)}'|grep -v -E "image/gif|image/jpeg|image/png"|awk '{print($1)}' >./$1/$1.url
cat ./$1/$1.txt |nl|awk '{print($4)}'|awk -F "/" '{print($3)}'|sort -u >./$1/$1.domain
mkdir ./$1/trash
mv ./$1/$1.txt ./$1/trash
mv ./$1/$1.no2019.txt ./$1/trash





