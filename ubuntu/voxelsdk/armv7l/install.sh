#!/bin/bash

# Install prerequisites
sudo ./install_dep.sh

# Download OpenNI and SensorKinect
sudo ./install_kinect.sh

# Build PCL
sudo ./install_pcl.sh

# Build Voxel SDK
sudo ./install_voxelsdk.sh

