#!/usr/bin/env bash
set -e

# platform information
export HOST_ARCH=x86_64
export HOST_VENDOR=linux
export HOST_OS=gnu
export HOST=$HOST_ARCH-$HOST_VENDOR-$HOST_OS
export TARGET=i686-w64-mingw32
export SHORT_NAME=mingw
export LONG_NAME=linux64mingwmultilib
export CRT_MULTILIB='--enable-lib64 --enable-lib32'
export GDB_PYTHON_WIN64_WORKAROUND=

# call main build script
. ./scripts/buildcrossfromnativemultilib.sh
