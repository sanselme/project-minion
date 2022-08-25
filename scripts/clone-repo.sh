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

# clone repositories
echo "Cloning repositories, if missing..."

[ ! -d build/buildroot ] && git clone https://github.com/bootlin/buildroot-toolchains.git build/buildroot
[ ! -d build/qemu ] && git clone https://github.com/qemu/qemu build/qemu
[ ! -d build/linux ] && git clone https://github.com/torvalds/linux build/linux
[ ! -d build/busybox ] && git clone https://git.busybox.net/busybox build/busybox
