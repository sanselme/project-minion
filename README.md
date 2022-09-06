# project-minion

[![Lint Code Base](https://github.com/sanselme/project-minion/actions/workflows/super-linter.yml/badge.svg)](https://github.com/sanselme/project-minion/actions/workflows/super-linter.yml)

## Usage

```bash
cmd/gru ${ARCH} ${IMAGE}

# examples:
cmd/gru riscv64 img/ubuntu/ubuntu-22.04-riscv64.qcow2
cmd/gru riscv64 img/debian/debian-riscv64.qcow2 '' img/debian/inird.qcow2 #with inird
```

### Baremetal

#### Build

<!-- TODO: Build -->

#### Run

```bash
cmd/minion ${ARCH} ${BINIMAGE}

# examples:
cmd/minion riscv64 bin/hello
```

---

Copyright © 2022 Schubert Anselme <schubert@anselm.es>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
