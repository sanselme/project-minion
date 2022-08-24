#!/bin/sh

set -eux

# clone repositories
echo "Cloning repositories..."
git clone https://github.com/qemu/qemu build/qemu
git clone https://github.com/torvalds/linux build/linux
git clone https://git.busybox.net/busybox build/busybox
