#!/bin/bash
cd /usr/local/src/chilitags
mkdir -p build-native
cd build-native
cmake \
    -DWITH_JNI_BINDINGS=ON \
    ..
make -j4

mkdir -p jars

cp /usr/local/src/opencv-2.4.8.2/build/bin/opencv-248.jar jars

rm -rf opencv/native/*
mkdir -p opencv/native/Linux64
cd opencv
cp /usr/local/src/opencv-2.4.8.2/build/lib/*.so native/Linux64
jar -cf ../jars/opencv-natives.jar native
cd ..

cp platforms/jni/src/*.jar jars

rm -rf native/Linux64/*
mkdir -p native/Linux64
cp platforms/jni/src/libchilitags_jni_bindings.so src/libchilitags.so native/Linux64
jar -cf jars/chilitags-natives.jar native

chown --recursive $1:$2 .
