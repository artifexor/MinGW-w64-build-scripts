#!/usr/bin/env bash
set -e

if [ -f licenses.marker ]
then
    echo "--> Licenses already installed"
else
    echo "--> Copying licenses"
    echo "---> Binutils/GDB"
    mkdir -p binutils
    mkdir -p gdb
    LICENSES="COPYING COPYING.LIB COPYING.LIBGLOSS COPYING.NEWLIB COPYING3 COPYING3.LIB"
    for file in $LICENSES
    do
        cp $SRC_DIR/binutils/$file binutils/$file
        if [ "$HOST" == "x86_64-w64-mingw32" ] || [ "$HOST" == "i686-w64-mingw32" ]
        then
            cp $SRC_DIR/gdb/$file gdb/$file
        fi
    done

    echo "---> CLooG"
    mkdir -p cloog
    echo "http://www.gnu.org/licenses/lgpl-2.1.html" > cloog/license.txt

    echo "---> Expat"
    mkdir -p expat
    cp $SRC_DIR/expat-$EXPAT_VERSION/COPYING expat/COPYING

    echo "---> GCC"
    mkdir -p gcc
    LICENSES="COPYING COPYING.LIB COPYING.RUNTIME COPYING3 COPYING3.LIB"
    for file in $LICENSES
    do
        cp $SRC_DIR/gcc/$file gcc/$file
    done

    echo "---> GMP"
    mkdir -p gmp
    cp $SRC_DIR/gmp-$GMP_VERSION/COPYING gmp/COPYING
    cp $SRC_DIR/gmp-$GMP_VERSION/COPYING.LIB gmp/COPYING.LIB

    echo "---> libiconv"
    mkdir -p libiconv
    cp $SRC_DIR/libiconv-$LIBICONV_VERSION/COPYING libiconv/COPYING
    cp $SRC_DIR/libiconv-$LIBICONV_VERSION/COPYING.LIB libiconv/COPYING.LIB

    echo "---> mingw-w64"
    mkdir -p mingw-w64
    cp $MINGW_W64_SRC/COPYING.MinGW-w64/COPYING.MinGW-w64.txt mingw-w64/COPYING.MinGW-w64.txt
    cp $MINGW_W64_SRC/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt mingw-w64/COPYING.MinGW-w64-runtime.txt
    cp $MINGW_W64_SRC/COPYING mingw-w64/COPYING
    cp $MINGW_W64_SRC/DISCLAIMER mingw-w64/DISCLAIMER
    cp $MINGW_W64_SRC/DISCLAIMER.PD mingw-w64/DISCLAIMER.PD
    cp $MINGW_W64_SRC/mingw-w64-headers/ddk/readme.txt mingw-w64/ddk-readme.txt
    cp $MINGW_W64_SRC/mingw-w64-headers/direct-x/COPYING.LIB mingw-w64/direct-x-COPYING.lib
    cp $MINGW_W64_SRC/mingw-w64-headers/direct-x/readme.txt mingw-w64/direct-x-readme.txt

    echo "---> MPC"
    mkdir -p mpc
    cp $SRC_DIR/mpc-$MPC_VERSION/COPYING.LIB mpc/COPYING.LIB

    echo "---> MPFR"
    mkdir -p mpfr
    cp $SRC_DIR/mpfr-$MPFR_VERSION/COPYING mpfr/COPYING
    cp $SRC_DIR/mpfr-$MPFR_VERSION/COPYING.LESSER mpfr/COPYING.LESSER
    
    echo "---> PPL"
    mkdir -p ppl
    cp $SRC_DIR/ppl-$PPL_VERSION/COPYING ppl/COPYING

    echo "---> Winpthreads"
    mkdir -p winpthreads
    cp $SRC_DIR/winpthreads/COPYING winpthreads/COPYING

    if [ "$HOST" != "x86_64-w64-mingw32" ] && [ "$HOST" != "i686-w64-mingw32" ]
    then
        echo "---> Skipping Make, Python and LLVM/Clang licenses"
    else
        echo "---> Make"
        mkdir -p make
        cp $SRC_DIR/make-$MAKE_VERSION/COPYING make/COPYING

        echo "---> Python"
        mkdir -p python
        cp $BUILD_DIR/python/LICENSE.txt python/LICENSE.txt

        echo "---> LLVM/Clang"
        mkdir -p LLVM
        cp $SRC_DIR/LLVM/CREDITS.TXT LLVM/CREDITS.TXT
        cp $SRC_DIR/LLVM/LICENSE.TXT LLVM/LICENSE.TXT
        mkdir -p clang
        cp $SRC_DIR/LLVM/tools/clang/LICENSE.TXT clang/LICENSE.TXT
    fi

    mkdir -p $PREFIX/licenses
    cp -r . $PREFIX/licenses
    echo "---> Done!"
fi
touch licenses.marker
