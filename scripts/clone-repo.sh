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

: "${UBOOT_VERSION:=2022.07}"
: "${LINUX_VERSION:=5.9}"
: "${BUSYBOX_VERSION:=1_35_0}"
: "${OPENSBI_VERSION:=1.1}"

# clone repositories
[ ! -d build/uboot ] && git clone https://github.com/u-boot/u-boot build/uboot --single-branch --depth 1 -b "v${UBOOT_VERSION}"
[ ! -d build/opensbi ] && git clone https://github.com/riscv-software-src/opensbi build/opensbi --single-branch --depth 1 -b "v${OPENSBI_VERSION}"
[ ! -d build/linux ] && git clone https://github.com/torvalds/linux build/linux --single-branch --depth 1 -b "v${LINUX_VERSION}"
[ ! -d build/busybox ] && git clone https://git.busybox.net/busybox build/busybox --single-branch --depth 1 -b "${BUSYBOX_VERSION}"
