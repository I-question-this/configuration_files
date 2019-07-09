#!/usr/bin/env bash

for jpg_image in $(ls *.jpg); do
  echo Converting $jpg_image to PNG
  convert  $jpg_image ${jpg_image%jpg*}png; 
  rm $jpg_image;
done
