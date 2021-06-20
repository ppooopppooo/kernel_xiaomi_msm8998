#!/bin/bash

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/run/media/ppooo/9a77a191-1a2f-4860-9894-0f26fb54298b/rom/Syberia/prebuilts/clang/host/linux-x86/clang-r383902b1/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/run/media/ppooo/9a77a191-1a2f-4860-9894-0f26fb54298b/rom/Syberia/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=/run/media/ppooo/9a77a191-1a2f-4860-9894-0f26fb54298b/rom/Syberia/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
export LD=${CLANG_PATH}/ld.lld

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out sagit_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j16
