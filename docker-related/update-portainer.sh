#!/bin/bash
set -e  # Exit on error

# Create backup directory if it doesn't exist
mkdir -p ~/portainer-backup

# Stop the existing Portainer container
echo "Stopping Portainer container..."
docker stop portainer

# Backup Portainer data
echo "Backing up Portainer data..."
docker cp portainer:/data ~/portainer-backup/

# Remove the stopped container to avoid naming conflicts
echo "Removing old Portainer container..."
docker rm portainer

# Pull the latest Portainer CE image (LTS version)
echo "Pulling the latest Portainer CE image..."
docker pull portainer/portainer-ce:lts

# Run the updated Portainer container
echo "Starting new Portainer container..."
docker run -d -p 8000:8000 -p 9443:9443 \
  --name=portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:lts

echo "Portainer update completed successfully."
