#!/bin/sh
#install git 1.7.8.3 and git-manpage 1.7.8.3
#Operation Checked Mac OS X 10.6 Snow Leopard
mkdir work
cd work
wget http://git-core.googlecode.com/files/git-1.7.8.3.tar.gz
tar xvfz git-1.7.8.3.tar.gz
cd git-1.7.8.3
./configure
make
make install
cd ../
wget http://git-core.googlecode.com/files/git-manpages-1.7.8.3.tar.gz
tar xjv -C /usr/local/share/man -f git-manpages-1.7.8.3.tar.gz
cd ../
rm -rf work
