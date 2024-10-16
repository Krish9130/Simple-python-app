#!/bin/bash
set -e
# Get the container ID or name running on port 5000
container_id=$(docker ps -q --filter "publish=5000")

# Check if a container is found
if [ -n "$container_id" ]; then
    echo "Stopping and removing container: $container_id"
    docker stop "$container_id"
    docker rm "$container_id"
else
    echo "No container is running on port 5000."
fi
