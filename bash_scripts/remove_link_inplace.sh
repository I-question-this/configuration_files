#!/bin/sh
# https://unix.stackexchange.com/a/66997/312391

dir=$(dirname -- $1)
tmp=$(TMPDIR=$dir mktemp)
cp -p -- "$1" "$tmp"
mv -f -- "$tmp" "$1"
