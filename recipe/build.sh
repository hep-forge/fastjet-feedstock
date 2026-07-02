#! /usr/bin/bash
set -e

# Bundled config.sub/config.guess predate aarch64 triplets -- replace with
# the current ones from the gnuconfig package before configuring.
for f in config.sub config.guess; do
  find . -name "$f" -exec cp "$BUILD_PREFIX/share/gnuconfig/$f" {} \;
done

./configure --prefix=$PREFIX --enable-allcxxplugins

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j$NPROC
make install

ln -sf libfastjet.so $PREFIX/lib/libfastjet.so.0
ln -sf libfastjettools.so $PREFIX/lib/libfastjettools.so.0
ln -sf libfastjetplugins.so $PREFIX/lib/libfastjetplugins.so.0
ln -sf libfastjetcontribfragile.so $PREFIX/lib/libfastjetcontribfragile.so.0
