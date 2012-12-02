#!/bin/sh
# link script : files in scripts link to /usr/local/bin

dir="scripts"
files=`ls -1 $dir`

for file in $files
do
    command="ln -s `pwd`/$dir/$file /usr/local/bin"
    echo $command
    $command
done
