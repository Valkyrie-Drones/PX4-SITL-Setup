# HEADLESS=1 make px4_sitl_default none
# cd ../Playground/ && uvicorn px4_test:app --reload --host 0.0.0.0 --port 8000
# cd ../Playground/ && uvicorn px4_test:app --reload --host 0.0.0.0 --port 8000 --ssl-keyfile="./0.0.0.0-key.pem" --ssl-certfile="./0.0.0.0.pem"
# ip addr show eth0
import socket
import asyncio
from fastapi import FastAPI, WebSocket, WebSocketDisconnect


# ------------------ FASTAPI ---------------------------------------

app = FastAPI()


async def send_data(mavlink_socket, websocket: WebSocket):
    while True:
        data = mavlink_socket.recv(1024)
        if not data:
            break
        await websocket.send_bytes(data)
        await asyncio.sleep(0.5)


async def receive_data(mavlink_socket, websocket: WebSocket):
    while True:
        data = await websocket.receive_bytes()
        if not data:
            break
        send_command_to_px4(mavlink_socket, data)
        await asyncio.sleep(2)

@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    print("Incoming connection")

    # Create a MAVLink socket connection
    mavlink_socket = start_ardupilot_stream()

    print('Connected to Ardupilot server!')

    send_task = asyncio.create_task(send_data(mavlink_socket, websocket))
    receive_task = asyncio.create_task(receive_data(mavlink_socket, websocket))

    try:
        await asyncio.gather(send_task, receive_task)
    except WebSocketDisconnect:
        send_task.cancel()
        receive_task.cancel()
        mavlink_socket.close()
        print('Disconnected from Ardupilot server')

# ------------------ PX4 SITL ---------------------------------------
UDP_IP = "127.0.0.1"  # IP address of the PX4 SITL instance
UDP_PORT = 14540  # Port number for the MAVLink UDP stream

def start_ardupilot_stream():

    # Create a MAVLink socket connection
    mavlink_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
#     mavlink_socket.connect((UDP_IP, UDP_PORT))
    mavlink_socket.bind((UDP_IP, UDP_PORT))

    return mavlink_socket


def send_command_to_px4(mavlink_socket, command: bytes):
    print(f'Sending command to Ardupilot')
    mavlink_socket.sendto(command, (UDP_IP, UDP_PORT))
