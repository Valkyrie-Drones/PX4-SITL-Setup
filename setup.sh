#! /usr/bin/env bash

REPO_NAME=PX4-SITL-Setup
FAST_API_FOLDER_NAME=fast-api-server
DEV_FOLDER_NAME=PX4-SITL

# Update the system
echo "Updating the system"
sudo apt-get update -y
echo "--- System updated"

# Install git
echo "Installing git"
sudo apt-get install git -y
echo "--- Git installed"

# Go to home directory
echo "Going to home directory"
cd ~
echo "--- In home directory"

# Make a directory with the $DEV_FOLDER_NAME
echo "Making a directory with the name $DEV_FOLDER_NAME"
mkdir $DEV_FOLDER_NAME
echo "--- Directory created"

# Go to the folder
echo "Going to the folder $DEV_FOLDER_NAME"
cd $DEV_FOLDER_NAME
echo "--- In the folder $DEV_FOLDER_NAME"

# Copy the FAST_API_FOLDER_NAME from ~/REPO_NAME to ~/DEV_FOLDER_NAME
echo "Copying the $FAST_API_FOLDER_NAME from ~/$REPO_NAME to ~/$DEV_FOLDER_NAME"
cp -r ~/$REPO_NAME/$FAST_API_FOLDER_NAME .
echo "--- Copied"

# Create a virtual environment
echo "Creating a virtual environment"
python3 -m venv env
echo "--- Virtual environment created"

# Activate the virtual environment
source env/bin/activate

# Install requirements.txt 
echo "Installing requirements.txt"
pip3 install -r ./$FAST_API_FOLDER_NAME/requirements.txt
echo "--- requirements.txt installed"

# Clone the PX4-Autopilot repository
# git clone https://github.com/PX4/PX4-Autopilot.git --recursive

# # Install PX4 dependencies
# sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh


