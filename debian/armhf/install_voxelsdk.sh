#!/bin/bash

cd ~/Software
git clone https://github.com/3dtof/voxelsdk.git

cd voxelsdk
sed 's/-msse2//g' CMakeLists.txt >> temp.txt
mv temp.txt CMakeLists.txt

cd ~/Software/voxelsdk/config
sed "s/\/etc\/lsb-release/\/usr\/bin\/lsb_release/g" common.cmake >> temp.txt
mv temp.txt common.cmake

cd ~/Software/voxelsdk/VoxelPCL
sed "s/\${codename} STREQUAL \"trusty\"/codename STREQUAL \"trusty\" OR codename STREQUAL \"jessie\"/g" CMakeLists.txt >> temp.txt
mv temp.txt CMakeLists.txt

cd ~/Software/voxelsdk
mkdir build
cd build

export CMAKE_PREFIX_PATH=$PWD:$CMAKE_PREFIX_PATH
cmake -DGENERATE_PYTHON_BINDINGS=OFF -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install

### PATCH CHANGELOG ###
# config/common.cmake
#    Change /etc/lsb-release to /usr/bin/lsb_release
#
# VoxelPCL/CMakeLists.txt
#    Add jessie as a platform

### USE BUILT VOXEL LIB ###
# export VOXEL_SDK_PATH=/path to voxel/build
# export PATH=$VOXEL_SDK_PATH/bin:$VOXEL_SDK_PATH/lib:$PATH
