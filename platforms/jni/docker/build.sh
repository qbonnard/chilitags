#!/bin/bash
cd /usr/local/src/chilitags
mkdir -p build-android-${ANDROID_ABI}
cd build-android-${ANDROID_ABI}
cmake \
    -DANDROID_PROJECT_ROOT=$(pwd)/android-project-root \
    -DCMAKE_TOOLCHAIN_FILE=$OpenCV_DIR/android.toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=$ANDROID_STANDALONE_TOOLCHAIN/sysroot/usr/ \
    ..
make -j4
make install
cp -r /usr/local/bin/android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/* $(pwd)/android-project-root/libs/
chown --recursive $1:$2 .
