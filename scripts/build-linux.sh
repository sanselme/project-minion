#!/bin/sh

# Copyright © 2022 Schubert Anselme <schubert@anselm.es>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -eux

: "${LINUX_VERSION:=5.9}"
: "${LINUX_ARCH:=riscv}"
: "${LINUX_CROSS_COMPILE:=riscv64-unknown-elf-gnu-}"

# build linux
cd build/linux

echo "building linux..."
git checkout "v${LINUX_VERSION}"
make ARCH="${LINUX_ARCH}" CROSS_COMPILE="${LINUX_CROSS_COMPILE}" defconfig

# compile kernel
make ARCH="${LINUX_ARCH}" CROSS_COMPILE="${LINUX_CROSS_COMPILE}" -j $(nproc)

# TODO: move kernel to kernel/
