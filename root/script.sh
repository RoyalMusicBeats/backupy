#!/bin/bash

mkdir /share
chmod 777 /share

rm /etc/samba/smb.conf
cat << EOF > /etc/samba/smb.conf
[global]
    workgroup = WORKGROUP
    server string = Samba Server %v
    netbios name = share
    security = user
    map to guest = bad user
    dns proxy = no

[public]
    path = /share
    writable = yes
    guest ok = yes
    guest only = yes
    force user = nobody
    force group = nogroup
    create mask = 0777
    directory mask = 0777
    browseable = yes
EOF
