#!/bin/bash

read -p "Enter Project Name: " proj_name
read -p "Enter Path to create the project: " path
read -p "Enter Python Version (in x.x.x format): " ver
read -p "Do you want to create Virtual Environment? [y/n (Default: y)]: " env_req

# Setting default values
if [ -z "$env_req"]; then
  env_req=${env_req:-y}
fi

if [ "$env_req"="y" ]; then
  read -p "Enter Name of Virtual Environment (Default: .venv): " env
  if [ -z "$env"]; then
    env=${env:-.venv}
  fi
fi

cur_dir=$(pwd)
python_dir="${path}/${proj_name}"

mkdir -p "$python_dir"
cd "$python_dir"

echo "Downloading Python..."
wget https://www.python.org/ftp/python/"$ver"/Python-"$ver".tgz  > /dev/null

# Extract the tarball
tar xzf Python-"$ver".tgz  > /dev/null

# Navigate to the Python directory
mkdir -p Python
cd Python-"$ver"

echo "Installing Python..."
# Prepare the source for installation
./configure --enable-optimizations --prefix="${python_dir}/Python"  > /dev/null

echo "Configuring Python..."
# Build and install Python
make -j 8  > /dev/null
sudo make altinstall  > /dev/null

cd ..

# Creating virtual environment
if [ "$env_req"="y" ]; then
  echo "Creating virtual environment"
  version_trimmed=${ver%.*}
  ./Python/bin/python$version_trimmed -m pip install virtualenv --no-warn-script-location
  ./Python/bin/python$version_trimmed -m virtualenv "./$env"
fi

# Clean up
sudo rm -rf Python-"$ver".tgz
sudo rm -rf Python-"$ver"
sudo chmod 777 "${python_dir}/Python" > /dev/null
sudo chown -hR $(whoami) "${python_dir}/Python" > /dev/null

cd "$cur_dir"
echo "Python $ver has been installed successfully..."
if [ "$env_req"="y" ]; then
  echo "Virtual environment created successfully..."
fi
