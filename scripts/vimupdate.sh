#!/bin/sh
#install vim7.3 by ftp
mkdir work
cd work
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxf vim-7.3.tar.bz2
mkdir vim73/patches
cd vim73/patches/
echo "prompt" > ftp.txt
echo "cd pub/vim/patches/7.3" >> ftp.txt
echo "mget 7.3.*" >> ftp.txt
echo "exit" >> ftp.txt
ftp -a ftp.vim.org < ftp.txt
cd ..
cat patches/7.3.* | patch -p0
./configure --enable-multibyte
make
make install
cd ../../
rm -rf work
