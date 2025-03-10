#!/bin/bash

# This script installs lazydocker

set -e

# Check if the user has sudo privileges
if ! sudo -n true 2>/dev/null; then
  echo "Sudo privileges are required to install lazydocker. Please run this script with sudo."
  exit 1
fi

# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "curl is required to download lazydocker. Please install curl."
    exit 1
fi

# Check if wget is installed
if ! command -v wget &> /dev/null
then
    echo "wget is required to download lazydocker. Please install wget."
    exit 1
fi

# Check if lazydocker is already installed
if command -v lazydocker &> /dev/null
then
    echo "lazydocker is already installed"
    exit 0
fi

# Check if tar is installed
if ! command -v tar &> /dev/null
then
    echo "tar is required to extract lazydocker. Please install tar."
    exit 1
fi

# Determine the architecture
OS=$(uname -s)
ARCH=$(uname -m)
case "$OS" in
    Linux)
        ;;
    Darwin)
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac

# Download the latest version of lazydocker
LAZYDOCKER_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest | grep tag_name | cut -d '"' -f 4)
DOWNLOAD_URL="https://github.com/jesseduffield/lazydocker/releases/download/${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION#v}_${OS}_${ARCH}.tar.gz"

echo "Downloading lazydocker from $DOWNLOAD_URL"
rm -f lazydocker.tar.gz
wget -q "$DOWNLOAD_URL" -O lazydocker.tar.gz

# Check if the file is empty
if [ -s lazydocker.tar.gz ]; then
  # Extract the archive
  echo "Extracting lazydocker.tar.gz"
  tar -xzf lazydocker.tar.gz
else
  echo "Error: lazydocker.tar.gz is empty"
  exit 1
fi

# Install lazydocker
echo "Installing lazydocker"
sudo mv lazydocker /usr/local/bin

# Clean up
echo "Cleaning up"
rm lazydocker.tar.gz

# Add alias to zsh if the user is using zsh
if [ "$SHELL" == "/bin/zsh" ]; then
    echo "Adding alias to ~/.zshrc"
    echo "echo alias lzd=\\'lazydocker\\' >> ~/.zshrc" | bash
    echo "Please restart your terminal or run 'source ~/.zshrc'"
fi

echo "lazydocker has been successfully installed"
