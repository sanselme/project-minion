#!/bin/bash

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
