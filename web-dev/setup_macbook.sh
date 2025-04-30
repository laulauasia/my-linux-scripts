#!/bin/bash

# Step 1: Install Python 3.10
echo "Installing Python 3.10..."
brew install python@3.10
python3.10 --version

# Step 2: Install Node.js 16.14
echo "Installing Node.js 16.14..."
brew install node@16
node --version

# Step 3: Install Vite 3.2
echo "Installing Vite 3.2..."
npm install -g vite@3.2
vite --version

# Step 4: Install Python Packages
echo "Installing Django..."
pip3.10 install django
django-admin --version

# Step 5: Install Node Packages
echo "Installing Vue CLI..."
npm install -g @vue/cli
vue --version

echo "Installing Next.js..."
npm install -g next
next --version

# Step 6: Configure Environment Variables
echo "Configuring environment variables..."
echo "API_KEY=your_api_key" >> ~/.env
echo "SECRET_KEY=your_secret_key" >> ~/.env
echo "DB_HOST=localhost" >> ~/.env
echo "DB_PORT=5432" >> ~/.env
echo "DB_USER=myuser" >> ~/.env
echo "DB_PASSWORD=mypassword" >> ~/.env

# Step 7: Verify the Environment
echo "Environment setup complete. Verify the installations and configurations."