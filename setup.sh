#! /usr/bin/env bash

REPO_NAME=PX4-SITL-Setup
FAST_API_FOLDER_NAME=fast-api-server
DEV_FOLDER_NAME=PX4-SITL

# Update the system
echo "Updating the system"
sudo apt-get update -y
echo "--- System updated"

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

# Copy the FAST_API_FOLDER_NAME from $HOME_DIRECTORY/REPO_NAME to $HOME_DIRECTORY/DEV_FOLDER_NAME
echo "Copying the $FAST_API_FOLDER_NAME from $HOME_DIRECTORY/$REPO_NAME to $HOME_DIRECTORY/$DEV_FOLDER_NAME"
cp -r ../$REPO_NAME/$FAST_API_FOLDER_NAME .
echo "--- Copied"

echo ""

# Create a virtual environment
echo "Creating a virtual environment"
python3 -m venv env
echo "--- Virtual environment created"

echo ""

# Activate the virtual environment
echo "Activating the virtual environment"
source env/bin/activate
echo "--- Virtual environment activated"

echo ""

# Install requirements.txt 
echo "Installing requirements.txt"
pip3 install -r ./$FAST_API_FOLDER_NAME/requirements.txt
echo "--- requirements.txt installed"

echo ""

# Clone the PX4-Autopilot repository
echo "Cloning the PX4-Autopilot repository"
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
echo "--- PX4-Autopilot repository cloned"

# Install PX4 dependencies
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh


