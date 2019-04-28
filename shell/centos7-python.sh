#!/bin/bash
yum install wget gcc make bzip2-devel ncurses-devel sqlite-devel gdbm-devel xz-devel tk-devel readline-devel
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
tar -xvf Python-3.6.8.tar
cd Python-3.6.8
./configure --prefix=/usr/local/python3.6 --enable-optimizations
make
make install