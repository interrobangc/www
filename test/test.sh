#!/usr/bin/env sh

if [ ! -f ./html/index.html ]; then
    echo "index.html does not exist!"
    exit 1
fi

echo "OK"