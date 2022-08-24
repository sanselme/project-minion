#!/bin/sh

set -eux

: "${QEMU_VERSION:=5.0.0}"
: "${QEMU_TARGET_ARCH:=riscv64-softmmu}"

# build qemu
cd build/qemu

echo "building qemu..."
git checkout "v${QEMU_VERSION}"
./configure --target-list=${QEMU_TARGET_ARCH}
make -j $(nproc)

# TODO: move qemu to bin/
