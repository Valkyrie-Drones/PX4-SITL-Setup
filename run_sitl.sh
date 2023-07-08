#! /usr/bin/env bash

DEV_FOLDER_NAME=PX4-SITL

# Start the SITL Server
echo "Starting the SITL Server"
cd ~/$DEV_FOLDER_NAME/PX4-Autopilot
HEADLESS=1 make px4_sitl_default none