#!/bin/sh
# unlink script : files in scripts unlink from /usr/local/bin

files=`ls -1 scripts`
for file in $files
do
    command="rm -f /usr/local/bin/$file"
    echo $command
    $command
done
