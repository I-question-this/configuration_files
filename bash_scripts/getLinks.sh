#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "$0: `basename $0` <HTML file> <file types>"
  exit 0
fi

# Get the a tags
grep -Eoi '<a [^>]+>' $1 |
# Get the hrefs
grep -Eo 'href="[^\"]+"' |
# Get the urls in the hrefs
grep -Eo '(http|https)://[a-zA-Z0-9./?=_-]*' |
# Get those ending with $2
grep -E "\\$2\$"
