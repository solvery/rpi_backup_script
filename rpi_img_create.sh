#/bin/bash

basedir=/workspace/d/
size=4000

# Create the disk and partition it
echo "Creating image file for Raspberry Pi2 FileSystem Backup!"
dd if=/dev/zero of=${basedir}/rpi2_backup.img bs=1M count=$size
parted ${basedir}/rpi2_backup.img --script -- mklabel msdos
parted ${basedir}/rpi2_backup.img --script -- mkpart primary fat32 0 64
parted ${basedir}/rpi2_backup.img --script -- mkpart primary ext4 64 -1

# Set the partition variables
loopdevice=`losetup -f --show ${basedir}/rpi2_backup.img`
device=`kpartx -va $loopdevice| sed -E 's/.*(loop[0-9])p.*/\1/g' | head -1`
device="/dev/mapper/${device}"
bootp=${device}p1
rootp=${device}p2

echo "Please Wait a moment..."
sleep 5

# Create file systems
mkfs.vfat $bootp
mkfs.ext4 $rootp

mkdir -p bootp root
mount $bootp bootp
mount $rootp root

