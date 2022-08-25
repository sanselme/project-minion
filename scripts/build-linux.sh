#!/bin/sh

set -eux

: "${LINUX_VERSION:=v5.4.0}"
: "${LINUX_ARCH:=riscv}"
: "${LINUX_CROSS_COMPILE:=riscv64-unknown-linux-gnu-}"

# build linux
cd build/linux

echo "building linux..."
git checkout "v${LINUX_VERSION}"
make ARCH="${LINUX_ARCH}" CROSS_COMPILE="${LINUX_CROSS_COMPILE}" defconfig

# compile kernel
make ARCH="${LINUX_ARCH}" CROSS_COMPILE="${LINUX_CROSS_COMPILE}" -j $(nproc)

# TODO: move kernel to kernel/
