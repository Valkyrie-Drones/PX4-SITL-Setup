#! /usr/bin/env bash

DEV_FOLDER_NAME=PX4-SITL
FAST_API_FOLDER_NAME=fast-api-server

# Start the FastAPI Server
echo "Starting the FastAPI Server"
cd ~/$DEV_FOLDER_NAME
source env/bin/activate
cd $FAST_API_FOLDER_NAME
uvicorn px4_test:app --reload --host 0.0.0.0 --port 8000 --ssl-keyfile="./0.0.0.0-key.pem" --ssl-certfile="./0.0.0.0.pem"