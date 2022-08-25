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

: "${DEVICE_SMP:=2}"
: "${DEVICE_MEM_MB:=2048}"

: "${DEVICE_FIRMWARE:=$PWD/firmware/opensbi-$1.bin}"
: "${DEVICE_KERNEL:=$PWD/kernel/u-boot-$1}"

# run
"qemu-system-${1}" \
  -machine "${DEVICE_BOARD:-virt}" \
  -smp "${DEVICE_SMP}" \
  -m "${DEVICE_MEM_MB}M" \
  -bios "${DEVICE_FIRMWARE}" \
  -kernel "${DEVICE_KERNEL}" \
  -device virtio-rng \
  -device virtio-blk-device,drive=hd0 \
  -device virtio-net-device,netdev=net0 \
  -drive id=hd0,file=${2} \
  -netdev user,id=net0,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::10443-:443 \
  -serial mon:stdio \
  -nographic
