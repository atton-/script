#!/bin/sh
# link script : files in scripts link to /usr/local/bin

dir="scripts"
target_dir="/usr/local/bin"
files=`ls -1 $dir`

for file in $files
do
    command="ln -s `pwd`/${dir}/${file} ${target_dir}"
    echo $command
    $command
done
