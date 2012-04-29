#!/usr/bin/env bash
set -e

# versions of different packages
export EXPAT_VERSION="2.0.1"
export LIBICONV_VERSION="1.14"
export GMP_VERSION="5.0.4"
export MPFR_VERSION="3.1.0"
export MPC_VERSION="0.9"
export PPL_VERSION="0.12.1"
export CLOOG_VERSION="0.17.0"
export BINUTILS_VERSION="2.22.52"
export GCC_VERSION="4.7.0"
export GDB_VERSION="7.4.1"
export PYTHON_VERSION="2.7.1"
export MAKE_VERSION="3.82"
export CLANG_VERSION="3.1"
export MINGW_W64_VERSION="tags/v2.0.3" #"trunk" #"stable/v2.x"

# my revision number
export MY_REVISION=-release
export MY_CLANG_REVISION=-release

# set bug url and such
export GNU_PACKAGE_OPTIONS="--with-pkgversion=rubenvb-$GCC_VERSION --with-bug-url=mingw-w64-public@lists.sourceforge.net"
