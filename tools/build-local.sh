#!/bin/bash


FILE_NAME=$(curl -s "https://archlinux.org/packages/extra/any/arch-wiki-docs/json/" | jq -r .filename)
FILE_URL="https://mirror.rackspace.com/archlinux/extra/os/x86_64/$FILE_NAME"

curl -L $FILE_URL -o wiki.tar.zst


mkdir -p build
mkdir -p public

tar -I zstd -xf wiki.tar.zst -C build
cp -rn build/usr/share/doc/arch-wiki/html/* public/


if [ -d "src" ]; then
    cp -rv src/* public/
fi
