#!/bin/bash
cd /usr/local/src/chilitags
mkdir -p build-android
cd build-android
cmake \
    -DANDROID_PROJECT_ROOT=$(pwd)/android-project-root \
    -DCMAKE_TOOLCHAIN_FILE=$OpenCV_DIR/android.toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=$ANDROID_STANDALONE_TOOLCHAIN/sysroot/usr/ \
    ..
make -j4
make install
cp /usr/local/bin/android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/lib* $(pwd)/android-project-root/libs/armeabi-v7a
chown --recursive $1:$2 .
