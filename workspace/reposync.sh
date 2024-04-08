#!/bin/bash

# Make sure to always install these packages to avoid build error abour rsycn, bison and flex
sudo apt-get install bison flex rsync bison device-tree-compiler bc -y

# Check if 'repo' command exists in PATH
if ! command -v repo &> /dev/null; then
    echo "'repo' command not found. Installing..."
    mkdir -p ~/bin  # Create bin directory if it doesn't exist
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo  # Download 'repo' tool
    chmod a+x ~/bin/repo  # Make 'repo' executable
    echo "'repo' command installed successfully."
else
    echo "'repo' command already exists."
fi

# Create directory for repo sync
mkdir -p android-kernel
cd android-kernel

# Disable Color UI
git config --global color.ui false

# Initialized manifest
repo init -u https://github.com/carlodandan/android_kernel_realme_sm6225-manifest -b OTHER

# Sync all repository inside the manifest
repo sync
