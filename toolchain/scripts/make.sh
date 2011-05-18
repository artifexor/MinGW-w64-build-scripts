#!/usr/bin/env bash
set -e

if [ -f configure.marker ]
then
    echo "--> Already configured"
else
    echo "--> Configuring"
    sh $SRC_DIR/make-$MAKE_VERSION/configure --host=$HOST --build=$BUILD --prefix=$PREFIX \
                                             --enable-case-insensitive-file-system --program-prefix='mingw32-' \
                                             CFLAGS="$BUILD_CFLAGS_LTO" LDFLAGS="$BUILD_LFLAGS_LTO" \
                                             > $LOG_DIR/make_configure.log 2>&1 || exit 1
    echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
    echo "--> Already built"
else
    echo "--> Building"
	/usr/bin/make $MAKE_OPTS > $LOG_DIR/make_build.log 2>&1 || exit 1
fi
touch build.marker
if [ -f install.marker ]
then
    echo "--> Already installed"
else
	/usr/bin/make $MAKE_OPTS install > $LOG_DIR/make_install.log 2>&1 || exit 1
fi
touch install.marker
