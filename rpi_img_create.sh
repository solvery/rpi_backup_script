#/bin/bash

basedir=/workspace/d/
size=4500

# Create the disk and partition it
echo "Creating image file for Raspberry Pi2 FileSystem Backup!"
dd if=/dev/zero of=${basedir}/rpi_ubuntu.img bs=1M count=$size
parted ${basedir}/rpi_ubuntu.img --script -- mklabel msdos
parted ${basedir}/rpi_ubuntu.img --script -- mkpart primary fat32 0 64
parted ${basedir}/rpi_ubuntu.img --script -- mkpart primary ext4 64 -1

# Set the partition variables
loopdevice=`losetup -f --show ${basedir}/rpi_ubuntu.img`
device=`kpartx -va $loopdevice| sed -E 's/.*(loop[0-9])p.*/\1/g' | head -1`
device="/dev/mapper/${device}"
bootp=${device}p1
rootp=${device}p2

echo "Please Wait a moment..."
sleep 5

# Create file systems
mkfs.vfat $bootp
mkfs.ext4 $rootp
