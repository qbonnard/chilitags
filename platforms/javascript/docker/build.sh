#!/bin/bash
echo Kikoo
cd /usr/local/src/chilitags
mkdir -p build-js
cd build-js
emconfigure cmake -DCMAKE_CXX_FLAGS="-O2 -DNDEBUG" -DCMAKE_INSTALL_PREFIX=$EMSCRIPTEN_ROOT/system -DOpenCV_DIR=$EMSCRIPTEN_ROOT/system/share/OpenCV -DWITH_TOOLS=OFF ..
make -j4
make install

cd ..
em++ \
    -std=c++11 \
    -O2 \
    -s OUTLINING_LIMIT=40000 \
    platforms/javascript/src/jschilitags.cpp \
    -lchilitags \
    -lopencv_core \
    -lopencv_imgproc \
    -lopencv_calib3d \
    -lopencv_highgui \
    -o build-js/chilitags.js \
    --post-js platforms/javascript/src/chilitags-javascript.js \
    -s EXPORTED_FUNCTIONS="['_setFilter', '_find', '_set3DFilter', '_set2DFilter', '_estimate', '_readTagConfiguration', '_setDefaultTagSize', '_readCalibration', '_getCameraMatrix', '_getDistortionCoeffs']"

chown --recursive $1:$2 build-js
