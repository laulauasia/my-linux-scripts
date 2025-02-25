#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Disabling AppArmor..."
systemctl stop apparmor
systemctl disable apparmor
aa-status || echo "AppArmor disabled successfully."

echo "Disabling and stopping UFW..."
ufw disable
systemctl stop ufw
systemctl disable ufw
echo "UFW has been disabled."

echo "All steps completed. You may need to reboot the system for full effect."