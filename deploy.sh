#!/bin/bash

# Variables
REMOTE_SERVER="root@54.245.36.65"  # Change to your remote server's IP and SSH user
IMAGE_NAME="capstone-image"            # Name of the Docker image
CONTAINER_NAME="competent_fermat"    # Desired container name
PORT="8080"                           # Port on which the container will be exposed
LOCAL_PORT="8080"                     # Local machine port to map the container

# Ensure SSH connection works
echo "Testing SSH connection to 54.245.36.65..."
ssh -q 54.245.36.65 exit
if [ $? -ne 0 ]; then
    echo "Error: Unable to connect to the remote server. Please check the SSH configuration."
    exit 1
fi

# Copy the Docker image to the remote server
echo "Saving the Docker image capstone-image  locally..."
docker save -o capstone-image.tar capstone-image

echo "Copying the Docker image to the remote server..."
scp capstone-image.tar 54.245.36.65:/tmp/

# Connect to the remote server and load the Docker image
echo "Loading the Docker image on the remote server..."
ssh 54.245.36.65  "docker load -i capstone-image /tmp/.tar"

# Remove the image file from the remote server
echo "Cleaning up the remote server..."
ssh 54.245.36.65   "rm /tmp/ capstone-image.tar"

# Check if the container already exists, then remove it
echo "Checking if the container already exists and stopping it if necessary..."
ssh 54.245.36.65   "docker ps -a | grep competent_fermat && docker stop competent_fermat && docker rm competent_fermat"

# Run the Docker container on the remote server
echo "Deploying the container on the remote server..."
ssh 54.245.36.65    "docker run -d -p $PORT:80 --name competent_fermat capstone-image "

# Verify the deployment
echo "Verifying deployment..."
ssh 54.245.36.65  "docker ps -a | grep competent_fermat "

echo "Deployment successful! Access the app at http://54.245.36.65:8080"

