#!/bin/sh

num=`ls . |grep ".._........\.txt" | wc -l`
num=`expr $num + 1`
header=`printf "%02d" $num`
date=`date "+%Y%m%d"`

filename=${header}_${date}.txt

touch ./$filename
echo "create $filename"
