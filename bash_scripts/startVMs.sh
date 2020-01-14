#!/bin/bash

Kali="49d2750e-b2bf-45a7-ac17-786864909a5b";
Metaspolitable="c90c154e-7f1c-4a6a-8d4b-7bfcb5264b01";

function is_vm_running () {
  if [ -n "$(VBoxManage showvminfo $1 | grep State | grep running)" ]; then
    return 0;
  else
    return 1;
  fi
}

function start_vm_headless () {
  if ! $(is_vm_running $1); then
    VBoxManage startvm $1 -type headless;
  fi
}

function poweroff_vm () {
  if $(is_vm_running $1); then
    VBoxManage controlvm $1 ascpipowerbutton;
  fi
}

function status_vm () {
  if $(is_vm_running $1); then
    status="Running";
  else
    status="Not Running";
  fi
  echo "$1: $status";
}

Error_msg="Must have 'on', 'off', or 'status' as a parameter"

if [ "$#" -ne 1 ]; then
  echo $Error_msg
  exit 1
fi

if [ "$1" = "on" ]; then
  start_vm_headless $Kali
  start_vm_headless $Metaspolitable
elif [ "$1" = "off" ]; then
  power_off_vm $Kali
  power_off_vm $Metaspolitable
elif [ "$1" = "status" ]; then
  status_vm $Kali
  status_vm $Metaspolitable
else
  echo $Error_msg
  exit 2
fi

