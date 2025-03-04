# Linux Server Requirements Installer

A bash script that automates the installation of common server requirements on Ubuntu systems with visual feedback and error handling.

![Script Preview](https://via.placeholder.com/800x400?text=Script+Preview)

## Features

- **Visual Installation Process**: Color-coded output with progress indicators
- **Error Handling**: Checks for successful installation at each step
- **Modular Design**: Well-structured code with functions for common operations
- **Root Privilege Check**: Ensures the script is run with proper permissions
- **Installation Summary**: Provides a clear overview of installed components

## What Gets Installed

The script installs the following components:

1. **Standard Utilities**:
   - curl
   - net-tools
   - git
   - software-properties-common
   - ca-certificates
   - imagemagick

2. **Docker and Docker Compose**:
   - docker-ce
   - docker-ce-cli
   - containerd.io
   - docker-buildx-plugin
   - docker-compose-plugin

3. **Redis**:
   - Redis server and client

4. **Webmin**:
   - Web-based system administration tool

## Requirements

- Ubuntu Linux distribution (tested on Ubuntu 20.04 LTS and newer)
- Root or sudo privileges
- Internet connection

## Usage

1. Make the script executable:
   ```bash
   chmod +x requirement.sh
   ```

2. Run the script with sudo:
   ```bash
   sudo ./requirement.sh
   ```

3. Follow the on-screen prompts and wait for the installation to complete.

## Customization

You can modify the script to add or remove packages based on your requirements:

- To add more standard packages, modify the `apt-get -y install` line in the "Installing Standard Utilities" section.
- To skip certain installations, comment out or remove the corresponding sections.

## Troubleshooting

If you encounter any issues during installation:

1. Check your internet connection
2. Ensure you're running the script with sudo privileges
3. Review the error messages displayed by the script
4. Verify that your system is compatible with the packages being installed

## License

This script is provided as-is under the MIT License. Feel free to modify and distribute it as needed.
