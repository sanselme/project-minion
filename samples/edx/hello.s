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

.global _start

_start:
  addi  a0, x0, 1
  la    a1, helloworld
  addi  a2, x0, 13
  addi  a7, x0, 64
  ecall

  addi  a0, x0, 0
  addi  a7, x0, 93
  ecall

.data
helloworld:
  .ascii "Hello, world!\n"
