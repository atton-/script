#!/bin/sh
hg clone https://code.google.com/p/vimperator-labs work
cd work
cd vimperator
make xpi
cd ..
open -a "firefox" downloads/*.xpi
cd ..
echo "please remove 'work'"
# rm -rf work
