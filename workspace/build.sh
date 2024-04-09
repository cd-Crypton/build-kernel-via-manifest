#!/bin/bash

# Reinstall packages just to make sure, no harm anyway
sudo apt-get install bison flex rsync bison device-tree-compiler bc -y

# Check if 'repo' command exists in PATH
if ! command -v repo &> /dev/null; then
    echo "'repo' command not found. Installing..."
    mkdir -p ~/bin  # Create bin directory if it doesn't exist
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo  # Download 'repo' tool
    chmod a+x ~/bin/repo  # Make 'repo' executable
    sudo ln -sf ~/bin/repo /usr/bin/repo
    echo "'repo' command installed successfully."
else
    echo "'repo' command already exists."
fi

# This will only server as fallback step, in case kernel has git submodules inside the tree.
# The name of the kernel directory depends on each kernel, so better to edit it.
cd android/sm6375
git submodule update --init --recursive
cd ../..

# Build Kernel
# On most cases, you have to use the right config path for BUILD_CONFIG variable. By default, this script target a symlink.
# Example: If your device kernel directory name sm6225, do it something like this, BUILD_CONFIG=sm6225/build.config.nameofconfig
cd android
BUILD_CONFIG=build.config build/build.sh 2>&1 | tee build.log