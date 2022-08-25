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
