#!/bin/sh

set -eux

: "${WORKDIR:=build/qemu}"

: "${QEMU_VERSION:=5.0.0}"
: "${QEMU_TARGET_ARCH:=riscv64-softmmu}"

# build qemu
cd "${WORKDIR}"

echo "building qemu..."
git checkout "v${QEMU_VERSION}"
./configure --target-list="${QEMU_TARGET_ARCH}"
make -j $(nproc)

# move qemu to bin/
sleep 3
cp -f "${WORKDIR}/elf2dmp" bin/
cp -f "${WORKDIR}/qemu-ga" bin/
cp -f "${WORKDIR}/qemu-edid" bin/
cp -f "${WORKDIR}/qemu-nbd" bin/
cp -f "${WORKDIR}/qemu-storage-daemon" bin/
cp -f "${WORKDIR}/qemu-io" bin/
cp -f "${WORKDIR}/qemu-img" bin/
cp -f "${WORKDIR}/riscv64-softmmu/qemu-system-riscv64" bin/
