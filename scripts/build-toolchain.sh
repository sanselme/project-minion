#!/bin/sh

set -eux

: "${TOOLCHAIN_VERSION:=2021.11-1}"

# build toolchain
cd build/buildroot

echo "building toolchain..."
git checkout "toolchains.bootlin.com-${TOOLCHAIN_VERSION}"
curl "http://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/build_fragments/riscv64-lp64d--musl--stable-${TOOLCHAIN_VERSION}.defconfig" > .config
make olddefconfig
make
make sdk

# TODO: move toolchain to bin/
