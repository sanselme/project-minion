#!/bin/sh

set -eux

# clean up
echo "cleaning up..."
rm -rf build/qemu build/linux build/busybox

brew uninstall \
  gawk \
  gnu-sed \
  gmp \
  mpfr \
  libmpc \
  isl \
  zlib \
  expat

brew cleanup
