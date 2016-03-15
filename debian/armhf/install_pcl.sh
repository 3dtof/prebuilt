#!/bin/bash

sudo apt-get install unzip
wget https://github.com/PointCloudLibrary/pcl/archive/pcl-1.7.2.zip
unzip pcl-1.7.2.zip
mv pcl-pcl-1.7.2 pcl
cd pcl
mkdir release
cd release
cmake -DCMAKE_BUILD_TYPE=None -DBUILD_apps=ON -DBUILD_examples=ON ..
make
sudo make install
make package
