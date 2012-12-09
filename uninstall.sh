#!/bin/sh
# unlink script : files in scripts unlink from /usr/local/bin

files=`ls -1 scripts`
target_dir="/usr/local/bin"

for file in $files
do
    command="rm -f ${target_dir}/${file}"
    echo $command
    #$command
done
