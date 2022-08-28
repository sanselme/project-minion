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

: "${FBSD_VERSION:=13.1}"

# TODO: build freebsd

# riscv
curl -sLO \
  "https://download.freebsd.org/releases/riscv/riscv64/ISO-IMAGES/13.1/CHECKSUM.SHA512-FreeBSD-13.1-RELEASE-riscv-riscv64-GENERICSD" \
  "/tmp/CHECKSUM.SHA512-FreeBSD-13.1-RELEASE-riscv-riscv64-GENERICSD"
curl -sLO \
  "https://download.freebsd.org/releases/riscv/riscv64/ISO-IMAGES/13.1/FreeBSD-13.1-RELEASE-riscv-riscv64-GENERICSD.img.xz" \
  "img/freebsd/riscv64/FreeBSD-13.1-RELEASE-riscv-riscv64-GENERICSD.img.xz"

# arm
curl -sLO \
  "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/${FBSD_VERSION}/CHECKSUM.SHA256-FreeBSD-${FBSD_VERSION}-RELEASE-arm64-aarch64" \
  "/tmp/CHECKSUM.SHA256-FreeBSD-${FBSD_VERSION}-RELEASE-arm64-aarch64"
curl -sLO \
  "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/${FBSD_VERSION}/FreeBSD-${FBSD_VERSION}-RELEASE-arm64-aarch64-memstick.img.xz" \
  "img/freebsd/FreeBSD-${FBSD_VERSION}-RELEASE-arm64-aarch64-memstick.img.xz"
