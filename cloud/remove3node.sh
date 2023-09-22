#!/bin/bash
source ./config
virsh destroy ${host1}
virsh undefine ${host1}
rm /mnt/focal-server-cloudimg${host1}.qcow2 
virsh destroy ${host2}
virsh undefine ${host2}
rm /mnt/focal-server-cloudimg${host2}.qcow2 
virsh destroy ${host3}
virsh undefine ${host3}
rm /mnt/focal-server-cloudimg${host3}.qcow2 
rm /mnt/test1-seed.img

