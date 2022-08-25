#!/bin/sh

set -eux

: "${WORKDIR:=build/qemu}"

: "${QEMU_VERSION:=5.0.0}"
: "${QEMU_TARGET_ARCH:=riscv64-softmmu}"

# build qemu
cd "${WORKDIR}""

echo "building qemu..."
git checkout "v${QEMU_VERSION}"
./configure --target-list="${QEMU_TARGET_ARCH}"
make -j $(nproc)

# TODO: move qemu to bin/
cp -f "${WORKDIR}/elf2dmp" bin/
cp -f ${WORKDIR}/qemu-{ga,edid,nbd,storage-daemon,io,img} bin/
cp -f "${WORKDIR}/riscv64-softmmu/qemu-system-riscv64" bin/
