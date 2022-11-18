#! /bin/bash
# please check the website: https://github.com/p4lang/p4c

git clone --recursive https://github.com/p4lang/p4c.git
cd p4c
git submodule update --init --recursive
mkdir build
cd build
cmake .. <optional arguments>
make -j4
make -j4 check
cd ../..
