#!/bin/sh

set -eux

# clone repositories
echo "Cloning repositories, if missing..."

[ ! -d build/buildroot ] && git clone https://github.com/bootlin/buildroot-toolchains.git build/buildroot
[ ! -d build/qemu ] && git clone https://github.com/qemu/qemu build/qemu
[ ! -d build/linux ] && git clone https://github.com/torvalds/linux build/linux
[ ! -d build/busybox ] && git clone https://git.busybox.net/busybox build/busybox
