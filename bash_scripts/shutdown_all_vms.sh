#!/bin/sh

for vm_name in $(VBoxManage list runningvms | cut -d' ' -f1 | sed -e 's/^"//' -e 's/"$//');
    do VBoxManage controlvm $vm_name acpipowerbutton;
done

number_of_vms=$(VBoxManage list runningvms | wc -w)
while $(test $number_of_vms -gt 0);
    do echo "# VMs left to shutdown: $number_of_vms";
       sleep 5s;
       number_of_vms=$(VBoxManage list runningvms | wc -w);
done
