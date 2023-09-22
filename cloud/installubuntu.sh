#!/bin/bash
source ./config
#wget https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-8.8-20230524.x86_64.qcow2
#wget https://cloud-images.ubuntu.com/focal/20230915/focal-server-cloudimg-amd64.img -P /mnt/  
sleep 7
qemu-img create -b /mnt/focal-server-cloudimg-amd64.img   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg${host1}.qcow2 45G
cloud-localds -v  --network-config=network_ubuntu.yaml   /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name ${host1} \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg'${host1}'.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
#  --extra-args "ip=192.168.245::192.168.1.1:255.255.255.0:test:ens2:none" \
#  --vnc --vnclisten=192.168.1.46 --vncport=5908
sleep 40
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
sleep 40
qemu-img create -b /mnt/focal-server-cloudimg-amd64.img   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg${host2}.qcow2 45G
cloud-localds -v --network-config=network_ubuntu2.yaml /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name ${host2} \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg'${host2}'.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
sleep 40
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
sleep 40
qemu-img create -b /mnt/focal-server-cloudimg-amd64.img   -f qcow2 -F qcow2 /mnt/focal-server-cloudimg${host3}.qcow2 45G
cloud-localds -v --network-config=network_ubuntu3.yaml /mnt/test1-seed.img cloud_init.cfg
sleep 10
virt-install --name ${host3} \
  --virt-type kvm \
  --memory 8112 \
  --vcpus 4 \
  --boot hd,menu=on \
  --cdrom /mnt/test1-seed.img \
  --disk path='/mnt/focal-server-cloudimg'${host3}'.qcow2',device='disk',size=45 \
  --graphics none \
  --network bridge=br0,model=virtio \
  --noautoconsole --wait 0
sleep 20
rm /etc/machine-id
touch /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
 


