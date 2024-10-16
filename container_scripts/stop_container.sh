#!/bin/bash
set -e

# Get the container ID or name running on port 5000
CONTAINER=$(docker ps -q --filter "expose=5000")

# Check if the container exists
if [ -n "$CONTAINER" ]; then
    echo "Stopping and removing container: $CONTAINER"
    # Stop the container
    docker stop "$CONTAINER"
    # Remove the container
    docker rm "$CONTAINER"
else
    echo "No container is running on port 5000."
fi
