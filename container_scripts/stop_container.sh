#!/bin/bash

# Specify the port to check
PORT=5000  # Change this to your desired port

# Get the container ID running on the specified port
container_id=$(docker ps -q --filter "expose=$PORT")

# Check if a container is running on the specified port
if [ -n "$container_id" ]; then
    # Container is running, stop it
    echo "Stopping container $container_id running on port $PORT..."
    docker stop "$container_id"
    echo "Container stopped."
else
    # Check if the container exists but is stopped
    container_id=$(docker ps -aq --filter "expose=$PORT")
    if [ -n "$container_id" ]; then
        # Container exists but is stopped, remove it
        echo "Removing stopped container $container_id..."
        docker rm "$container_id"
        echo "Container removed."
    else
        # No container found
        echo "Container is not present."
    fi
fi
