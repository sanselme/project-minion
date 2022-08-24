#!/bin/sh

set -eux

# install packages
echo "installing packages..."
brew install \
  gawk \
  gnu-sed \
  gmp \
  mpfr \
  libmpc \
  isl \
  zlib \
  expat
