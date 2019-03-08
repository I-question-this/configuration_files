#!/usr/bin/env bash

# This uses Dieter Steven's pdfid.py to disarm pdfs
# This uses parameter expansion 

find . -type f -execdir bash -c 'pdfid.py -d $0;mv ${0%pdf*}disarmed.pdf $0' {} \;
