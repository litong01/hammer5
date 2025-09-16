#!/bin/bash
# build and remove dangling images in the system
DOCKER_CLI_HINTS=off docker build -t docker.io/tli551/hammer5:latest .
danglingImages=$(DOCKER_CLI_HINTS=off docker images -f "dangling=true" -q)
if [ -n "$danglingImages" ]; then
    echo "Removing dangling images..."
    DOCKER_CLI_HINTS=off docker rmi -f $danglingImages
fi
