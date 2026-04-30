#!/bin/bash

set -e

echo "Updating package list..."
sudo apt update

# Docker
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
else
    echo "Docker is already installed."
fi

# Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    sudo apt install -y docker-compose
else
    echo "Docker Compose is already installed."
fi

# Python 3
if ! command -v python3 &> /dev/null; then
    echo "Installing Python 3..."
    sudo apt install -y python3
else
    echo "Python 3 is already installed."
fi

# pip
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip..."
    sudo apt install -y python3-pip
else
    echo "pip is already installed."
fi

# python3-venv
if ! python3 -m venv --help &> /dev/null; then
    echo "Installing python3-venv..."
    sudo apt install -y python3-venv
else
    echo "python3-venv is already installed."
fi

# Virtual environment
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Django in venv
source venv/bin/activate

if ! python -m django --version &> /dev/null; then
    echo "Installing Django in virtual environment..."
    pip install django
else
    echo "Django is already installed in virtual environment."
fi

deactivate

echo "All tools are installed successfully!"