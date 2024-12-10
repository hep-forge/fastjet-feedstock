#! /usr/bin/bash

./configure --prefix=$PREFIX --enable-allcxxplugins

make -j$(nproc)
make install
