#!/bin/sh

mkdir /share
chmod 777 /share

rm /etc/samba/smb.conf
cat << EOF > /etc/samba/smb.conf
[global]
    workgroup = WORKGROUP
    server string = samba_server
    netbios name = share
    security = user
    map to guest = bad user
    dns proxy = no

[share]
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

while true; do
    openrc / init
    service samba restart
    sleep 1
done
