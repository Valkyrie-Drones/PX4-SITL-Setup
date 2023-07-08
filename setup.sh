#! /usr/bin/env bash

REPO_NAME=PX4-SITL-Setup
FAST_API_FOLDER_NAME=fast-api-server
DEV_FOLDER_NAME=PX4-SITL

# Update the system
sudo apt-get update -y

# Install git
sudo apt-get install git -y

# Go to home directory
cd ~

# Make a directory with the DEV_FOLDER_NAME
mkdir $DEV_FOLDER_NAME

# Go to the folder
cd $DEV_FOLDER_NAME

# Copy the FAST_API_FOLDER_NAME from ~/REPO_NAME to ~/DEV_FOLDER_NAME
cp -r ~/$REPO_NAME/$FAST_API_FOLDER_NAME .

# Create a virtual environment
python3 -m venv env

# Activate the virtual environment
source env/bin/activate

# Install requirements.txt 
pip3 install -r ./requirements.txt

# Clone the PX4-Autopilot repository
# git clone https://github.com/PX4/PX4-Autopilot.git --recursive

# # Install PX4 dependencies
# sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh


