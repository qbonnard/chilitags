docker build -t emscripten - < platforms/javascript/docker/emscripten-1.16.0 
docker tag emscripten emscripten-opencv:1.16.0
docker build -t emscripten-opencv - < platforms/javascript/docker/opencv-2.4.9
docker tag emscripten-opencv emscripten-opencv:2.4.9
docker run --rm -v $(pwd):/usr/local/src/chilitags emscripten-opencv /usr/local/src/chilitags/platforms/javascript/docker/build.sh $UID $UID


#docker build -t ndk - < jni/docker/ndk-r9d
#docker tag ndk:latest ndk:r9d
#docker build -t toolchain - < jni/docker/toolchain-x86.api14 
#docker tag toolchain:latest toolchain:x86.api14
#docker build -t android-opencv - < jni/docker/opencv-2.4.8
#docker tag android-opencv android-opencv:2.4.8
#docker run --rm -v $(pwd)/..:/usr/local/src/chilitags android-opencv /usr/local/src/chilitags/platforms/jni/docker/build.sh $UID $UID
#
#docker build -t toolchain - < jni/docker/toolchain-arm7.api14 
#docker tag toolchain:latest toolchain:arm7.api14
#docker build -t android-opencv - < jni/docker/opencv-2.4.8
#docker tag android-opencv android-opencv:2.4.8
#docker run --rm -v $(pwd)/..:/usr/local/src/chilitags android-opencv /usr/local/src/chilitags/platforms/jni/docker/build.sh $UID $UID
#
#
#docker build -t native-opencv - < native/docker/opencv-2.4.8
#docker tag native-opencv native-opencv:2.4.8
#docker run --rm -v $(pwd)/..:/usr/local/src/chilitags native-opencv /usr/local/src/chilitags/platforms/native/docker/build.sh $UID $UID
