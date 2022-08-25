#!/bin/sh

set -eux

: "${CROSS_COMPILE:=riscv{{bits\}\}-unknown-linux-gnu-}"

# build busybox
cd build/busybox

echo "building busybox..."
CROSS_COMPILE="${CROSS_COMPILE}" make -j defconfig
CROSS_COMPILE="${CROSS_COMPILE}" make -j $(nproc)

# TODO: move busybox to img/
