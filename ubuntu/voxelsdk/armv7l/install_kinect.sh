#!/bin/bash

mkdir ~/Software/kinect

# Build OpenNI 

cd ~/Software/kinect
git clone https://github.com/OpenNI/OpenNI.git
cd OpenNI
git checkout unstable
cd Platform/Linux/Build/Common
sed 's/-mfloat-abi=softfp//g' Platform.Arm >> temp.Arm   
mv temp.Arm Platform.Arm  
cd ../../CreateRedist
chmod +x RedistMaker
./RedistMaker
cd ../Redist/OpenNI-Bin-Dev-Linux-Arm-v1.5.8.5
sudo ./install.sh 
 
# Build SensorKinect

cd ~/Software/kinect 
git clone https://github.com/ph4m/SensorKinect.git
cd SensorKinect
git checkout unstable
cd Platform/Linux/Build/Common
sed 's/-mfloat-abi=softfp//g' Platform.Arm >> temp.Arm   
mv temp.Arm Platform.Arm  
cd ../../CreateRedist
chmod +x RedistMaker
./RedistMaker
cd ../Redist/Sensor-Bin-Linux-Arm-v5.1.2.1/
chmod +x install.sh
sudo ./install.sh
cd ~/Software 

