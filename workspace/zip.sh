#!/bin/bash

if [ -f android-kernel/out/android-4.19-stable/dist/Image.gz ]; then
    echo "Kernel exist, copying..."
    cd android-kernel/out/android-4.19-stable/dist/
    cp -r Image.gz ../../../AnyKernel3
    echo "Preparing AnyKernel3 zip..."
    cd ../../../AnyKernel3
    rm -rf UPDATE-AnyKernel3.zip
    echo "Start compressing new kernel zip..."
    zip -r9 UPDATE-AnyKernel3.zip * -x .git README.md *placeholder
else
    echo "Kernel did not exist at all!"
    exit 1
fi