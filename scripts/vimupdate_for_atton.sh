#!/bin/sh
# vim install by mercurial and customized for atton
mkdir work
cd work
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure --enable-multibyte --enable-pythoninterp=yes --enable-rubyinterp=yes
make
make install
cd ../../
rm -rf work
