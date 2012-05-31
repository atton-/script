#!/bin/sh

num=`ls . |wc -l`
header=`printf "%02d" $num`
date=`date "+%Y%m%d"`

filename=${header}_${date}.txt

touch ./$filename
echo "create $filename"
