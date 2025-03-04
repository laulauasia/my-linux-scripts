#!/bin/bash
#
# Linux Server Requirements Installer
# This script installs common server requirements including:
# - Standard utilities
# - Docker and Docker Compose
# - Redis
# - Webmin
#

# Color definitions
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print section headers
print_section() {
    echo -e "\n${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ ${YELLOW}$1${NC}${BLUE} ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
}

# Function to print status messages
print_status() {
    echo -e "${YELLOW}➜ ${NC}$1"
}

# Function to print success messages
print_success() {
    echo -e "${GREEN}✓ ${NC}$1"
}

# Function to print error messages
print_error() {
    echo -e "${RED}✗ ${NC}$1"
}

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    print_error "This script must be run as root or with sudo"
    exit 1
fi

# Update package lists
print_section "Updating Package Lists"
print_status "Updating apt package lists..."
apt-get update
if [ $? -eq 0 ]; then
    print_success "Package lists updated successfully"
else
    print_error "Failed to update package lists"
fi

# Install standard packages
print_section "Installing Standard Utilities"
print_status "Installing curl, net-tools, git, and other utilities..."
apt-get -y install curl net-tools git software-properties-common ca-certificates imagemagick
if [ $? -eq 0 ]; then
    print_success "Standard utilities installed successfully"
else
    print_error "Failed to install standard utilities"
fi

# Install Docker
print_section "Installing Docker"
print_status "Setting up Docker repository..."

# Add Docker's official GPG key
print_status "Adding Docker's GPG key..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
print_status "Adding Docker repository to apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt package index
print_status "Updating package index..."
apt-get update

# Install Docker packages
print_status "Installing Docker packages..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
if [ $? -eq 0 ]; then
    print_success "Docker installed successfully"
else
    print_error "Failed to install Docker"
fi

# Install Redis
print_section "Installing Redis"
print_status "Setting up Redis repository..."

# Add Redis GPG key
print_status "Adding Redis GPG key..."
apt-get install -y lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg

# Add Redis repository
print_status "Adding Redis repository to apt sources..."
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

# Update apt package index
print_status "Updating package index..."
apt-get update

# Install Redis
print_status "Installing Redis..."
apt-get install -y redis
if [ $? -eq 0 ]; then
    print_success "Redis installed successfully"
else
    print_error "Failed to install Redis"
fi

# Install Webmin
print_section "Installing Webmin"
print_status "Setting up Webmin repository..."

# Download and run Webmin setup script
print_status "Downloading Webmin setup script..."
curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh

# Run Webmin setup script
print_status "Running Webmin setup script..."
sh webmin-setup-repo.sh
if [ $? -eq 0 ]; then
    print_success "Webmin installed successfully"
else
    print_error "Failed to install Webmin"
fi

# Installation complete
print_section "Installation Complete"
echo -e "${GREEN}All components have been installed.${NC}"
echo -e "${YELLOW}Summary:${NC}"
echo -e "  ${GREEN}✓${NC} Standard utilities"
echo -e "  ${GREEN}✓${NC} Docker and Docker Compose"
echo -e "  ${GREEN}✓${NC} Redis"
echo -e "  ${GREEN}✓${NC} Webmin"
echo -e "\n${BLUE}You can now proceed with your server configuration.${NC}"
