#!/bin/bash
cd /usr/local/src/chilitags
mkdir -p build-native
cd build-native
cmake \
    -DWITH_JNI_BINDINGS=ON \
    ..
make -j4
make install
chown --recursive $1:$2 .
