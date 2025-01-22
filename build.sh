#!/bin/bash

# Set the image name
IMAGE_NAME="capstone-image"

# Print a message indicating the build process is starting
echo "Starting to build the Docker image: $ capstone-image "

# Ensure we're in the right directory (optional)
cd "$(dirname "$0") || exit 1"

# Check if Dockerfile exists
if [ ! -f Dockerfile ]; then
    echo "Error: Dockerfile not found in the current directory!"
    exit 1
fi

# Build the Docker image
docker build -t $ capstone-image.

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image $ capstone-image built successfully!"
else
    echo "Error: Docker image build failed!"
    exit 1
fi


