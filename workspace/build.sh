#!/bin/bash

# Reinstall packages just to make sure, no harm anyway
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

# Build Kernel
cd android-kernel
BUILD_CONFIG=build.config build/build.sh 2>&1 | tee build.log