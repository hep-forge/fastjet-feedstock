#! /usr/bin/bash

./configure --prefix=$PREFIX --enable-allcxxplugins

make -j$(nproc)
make install

ln -sf libfastjet.so $PREFIX/lib/libfastjet.so.0
ln -sf libfastjettools.so $PREFIX/lib/libfastjettools.so.0
ln -sf libfastjetplugins.so $PREFIX/lib/libfastjetplugins.so.0
ln -sf libfastjetcontribfragile.so $PREFIX/lib/libfastjetcontribfragile.so.0
