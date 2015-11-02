#!/bin/bash

cd ~/Software
git clone https://github.com/3dtof/voxelsdk.git
cd voxelsdk
sed 's/-msse2//g' CMakeLists.txt >> temp.txt
mv temp.txt CMakeLists.txt
mkdir build
cd build
export CMAKE_PREFIX_PATH=$PWD:$CMAKE_PREFIX_PATH
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DSWIG_EXECUTABLE=/usr/bin/swig3.0 ..
make
sudo make install


