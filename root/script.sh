#!/bin/sh

mkdir /share
chmod 777 /share

echo $SAMBA_DESTINATION

# mount -t cifs -o credentials=<Credentials Filename> //192.0.2.17/SharedFiles /mnt/smb_share

#rm /etc/samba/smb.conf
#cat << EOF > /etc/samba/smb.conf
#[global]
#    workgroup = WORKGROUP
#    server string = samba_server
#    netbios name = share
#    security = user
#    map to guest = bad user
#    dns proxy = no
#
#[share]
#    path = /share
#    writable = yes
#    guest ok = yes
#    guest only = yes
#    force user = nobody
#    force group = nogroup
#    create mask = 0777
#    directory mask = 0777
#    browseable = yes
#EOF