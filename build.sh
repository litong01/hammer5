#!/bin/bash
# build and remove dangling images in the system
DOCKER_CLI_HINTS=off docker build -t docker.io/tli551/hammer5:latest .
DOCKER_CLI_HINTS=off docker tag docker.io/tli551/hammer5:latest docker.io/tli551/hammer5:v0.1.0
danglingImages=$(DOCKER_CLI_HINTS=off docker images -f "dangling=true" -q)
if [ -n "$danglingImages" ]; then
    echo "Removing dangling images..."
    DOCKER_CLI_HINTS=off docker rmi -f $danglingImages
fi
