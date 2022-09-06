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

set -ex

: "${CROSS_COMPILE:=riscv64-linux-gnu-}"

# build busybox
cd build/busybox

echo "building busybox..."
CROSS_COMPILE="${CROSS_COMPILE}" LDFLAGS=--static make -j defconfig
CROSS_COMPILE="${CROSS_COMPILE}" LDFLAGS=--static make -j "$(nproc)"

# preparing rootfs
dd if=/dev/zero of=rootfs.img bs=1M count=1024
mkfs.ext4 rootfs.img

mkdir -p rootfs
mount -t ext4 -o loop rootfs.img rootfs

CROSS_COMPILE="${CROSS_COMPILE}" LDFLAGS=--static make -C "${PWD}" install CONFIG_PREFIX=rootfs

mkdir -p rootfs/proc rootfs/sys rootfs/dev
mkdir -p rootfs/etc/init.d

touch rootfs/etc/fstab # silence warnings on poweroff

cat >rootfs/etc/resolv.conf <<EOF
nameserver 1.1.1.1
nameserver 9.9.9.9
search local
EOF

cat >rootfs/etc/init.d/rcS <<EOF
#!/bin/sh

echo "Hello RISC-V"

mount -t proc proc /proc
mount -t sysfs sysfs /sys

ip addr add 10.0.2.15/24 dev eth0
ip link set eth0 up

ip route add default via 10.0.2.2 dev eth0
EOF

chmod +x rootfs/etc/init.d/rcS
umount rootfs

# copy busybox to bin/
cp -f busybox ../bin/busybox

# copy rootfs to img/
cp -f rootfs.img ../img/busybox-riscv64.img
