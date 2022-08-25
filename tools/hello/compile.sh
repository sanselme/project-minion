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

# compile
risc32-unknown-elf-gcc \
  -march=rv32 \
  -mabi=ilp32 \
  -mcmodel=medany \
  -fvisibility=hidden \
  -static \
  -nostdlib \
  -nostartfiles \
  -T "${PWD}/src/demo/hello.ld" \
  -o "${PWD}/bin/hello" \
  "${PWD}/src/demo/hello.s"

# convert to hex
risc32-unknown-elf-objcopy \
  -O ihex \
  "${PWD}/bin/hello" \
  "${PWD}/bin/hello.hex"
