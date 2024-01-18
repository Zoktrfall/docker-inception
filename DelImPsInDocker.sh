#!/bin/bash

running_containers=$(docker ps -aq)
if [ -n "$running_containers" ]; then
    docker kill $running_containers
    docker rm $running_containers
    echo "Docker: Running containers stopped and removed."
else
    echo "Docker: No running containers to stop and remove."
fi

all_images=$(docker images -q)
if [ -n "$all_images" ]; then
    docker rmi $all_images
    echo "Docker: All images removed."
else
    echo "Docker: No images to remove."
fi

all_volumes=$(docker volume ls -q)
if [ -n "$all_volumes" ]; then
    docker volume rm $all_volumes
    echo "Docker: All volumes removed."
else
    echo "Docker: No volumes to remove."
fi
