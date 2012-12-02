#!/bin/sh
# vim install by mercurial
mkdir work
cd work
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --enable-multibyte
make
make install
cd ../../
rm -rf work
