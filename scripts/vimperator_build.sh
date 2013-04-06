#!/bin/sh
# vimperator build script for Mac

VIMPERATOR_REPO_URL='https://code.google.com/p/vimperator-labs'

function command_exist_check() {
    which $1 >& /dev/null
    if [ $? -ne 0 ]; then
        echo "command not found ${$1}"
        echo "abort install script"
        exit
    fi
}

# vimperator build in mac require GNU sed and GNU cp
command_exist_check 'hg'        # for repo downloads
command_exist_check 'gcp'       # for build 
command_exist_check 'gsed'      # for build

hg clone ${VIMPERATOR_REPO_URL} work
cd work
make -e SED=gsed CP=gcp -C vimperator xpi
cd ..
echo
echo "vimperator build successfully."
echo "vimperator location is work/downloads/*.xpi"
echo "please remove work directory install finised"
# rm -rf work
