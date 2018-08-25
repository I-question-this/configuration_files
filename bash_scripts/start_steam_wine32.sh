#!/bin/bash

WINEPREFIX="$HOME/.wine32"
wine "$WINEPREFIX/drive_c/Program Files/Steam/Steam.exe" -no-cef-sandbox > /dev/null 2> /dev/null &
