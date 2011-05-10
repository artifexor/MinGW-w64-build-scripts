#!/usr/bin/env bash
set -e

if [ -f cleanup.marker ]
then
    echo "--> Already cleaned up"
else
    echo "--> Cleaning up"
    cd $PREFIX
    rm -rf mingw || exit 1
    find . -name \*.la -exec rm -f {} \;

    echo "--> Stripping Executables"
    find . -name \*.exe -exec strip {} \;


    if [[ "$TARGET" == "$HOST" ]]
    then 
        echo "--> Copying and stripping DLL's"
        cp $GCC_LIBS/bin/*.dll $PREFIX/bin
        $HOST-strip $PREFIX/bin/*.dll
    else
        echo "--> No DLL's to copy for cross-compiler"
    fi
fi
touch cleanup.marker
