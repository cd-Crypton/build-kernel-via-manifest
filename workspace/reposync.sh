#!/bin/bash

# Make sure to always install these packages to avoid build error abour rsycn, bison and flex
sudo apt-get install bison flex rsync bison device-tree-compiler bc -y

# Make sure repo is installed
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
sudo ln -sf ~/bin/repo /usr/bin/repo

# Create directory for repo sync
mkdir -p android-kernel
cd android-kernel

# Disable Color UI
git config --global color.ui false

# Initialized manifest
repo init -u https://github.com/carlodandan/android_kernel_realme_sm6225-manifest -b OTHER

# Sync all repository inside the manifest
repo sync
