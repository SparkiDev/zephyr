#!/bin/sh

WOLFSSL_SRC_DIR=~/wolfssl/dev2/wolfssl
if [ $# -gt 0 ]; then
    WOLFSSL_SRC_DIR=$1
fi

if [ ! -d $WOLFSSL_SRC_DIR ]; then
    echo "Directory does not exist: $WOLFSSL_SRC_DIR"
    exit 1
fi

rm -rf library
mkdir library
mkdir library/src
mkdir -p library/wolfcrypt/src

cp -rf ${WOLFSSL_SRC_DIR}/src/*.c library/src/
cp -rf ${WOLFSSL_SRC_DIR}/wolfcrypt/src/*.c library/wolfcrypt/src/
cp -rf ${WOLFSSL_SRC_DIR}/wolfcrypt/src/*.i library/wolfcrypt/src/
cp -rf ${WOLFSSL_SRC_DIR}/wolfcrypt/src/*.S library/wolfcrypt/src/

rm -rf include
mkdir include

#cp config.h include/
cp user_settings.h include/
cp -rf ${WOLFSSL_SRC_DIR}/wolfssl include/
rm -f include/wolfssl/options.h
rm -rf include/wolfssl/wolfcrypt/port

