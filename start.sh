#!/bin/bash

# 1. Setup
mkdir -p ./downloads
xhost +local:docker

# 2. Define the cleanup function
cleanup() {
    echo " Catching SIGINT (Ctrl+C)... shutting down."
    docker compose down
    exit 0
}

# 3. Register the trap
# This tells the script: "If you see SIGINT (Ctrl+C), run the cleanup function"
trap cleanup SIGINT

# 4. Start Docker Compose
# We use 'up' normally. If you hit Ctrl+C, the trap triggers.
docker compose up
