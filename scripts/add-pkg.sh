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

# FIXME: check linux is ubuntu/debian
# TODO: add freebsd support
if [ "${OSTYPE}" == "darwin"* ]; then
  # add repo
  brew tap riscv-software-src/riscv

  # install packages
  echo "installing packages..."
  brew install \
    expat \
    gawk \
    gmp \
    gnu-sed \
    isl \
    libmpc \
    mpfr \
    riscv-openocd \
    riscv-tools \
    zlib
elif [ "${OSTYPE}" == "linux-gnu"* ]; then
  apt install -y \
    autoconf \
    automake \
    autotools-dev \
    bc \
    bison \
    build-essential \
    curl \
    flex \
    gawk \
    git \
    gperf \
    libexpat-dev \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    libtool \
    patchutils \
    texinfo \
    zlib1g-dev
fi
