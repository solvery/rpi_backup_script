#/bin/bash

umount $1"b"
umount $1"r"
kpartx -dv /dev/loop$1
losetup -d /dev/loop$1

