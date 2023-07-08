#! /usr/bin/env bash

REPO_NAME=PX4-SITL-Setup
FAST_API_FOLDER_NAME=fast-api-server
DEV_FOLDER_NAME=PX4-SITL

# Update the system
echo "Updating the system"
sudo apt-get update -y
echo "--- System updated"

echo ""

# Install git
echo "Installing git"
sudo apt-get install git -y
echo "--- Git installed"

echo ""

# Go to home directory
echo "Going to home directory"
cd ~
echo "--- In home directory"

echo ""

# Make a directory with the $DEV_FOLDER_NAME
echo "Making a directory with the name $DEV_FOLDER_NAME"
mkdir $DEV_FOLDER_NAME
echo "--- Directory created"

echo ""

# Go to the folder
echo "Going to the folder $DEV_FOLDER_NAME"
cd $DEV_FOLDER_NAME
echo "--- In the folder $DEV_FOLDER_NAME"

echo ""

# Copy the FAST_API_FOLDER_NAME from ~/REPO_NAME to ~/DEV_FOLDER_NAME
echo "Copying the $FAST_API_FOLDER_NAME from ~/$REPO_NAME to ~/$DEV_FOLDER_NAME"
cp -r ~/$REPO_NAME/$FAST_API_FOLDER_NAME ~/$DEV_FOLDER_NAME
echo "--- Copied"

echo ""

# Create a virtual environment
echo "Creating a virtual environment"
python3 -m venv env
echo "--- Virtual environment created"

echo ""

# Activate the virtual environment
source env/bin/activate

echo ""

# Install requirements.txt 
echo "Installing requirements.txt"
pip3 install -r ./$FAST_API_FOLDER_NAME/requirements.txt
echo "--- requirements.txt installed"

echo ""

# Clone the PX4-Autopilot repository
# git clone https://github.com/PX4/PX4-Autopilot.git --recursive

# # Install PX4 dependencies
# sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh


