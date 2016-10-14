#/bin/bash

umount b$1
umount r$1
kpartx -dv /dev/loop$1
losetup -d /dev/loop$1

