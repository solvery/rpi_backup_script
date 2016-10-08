#/bin/bash

img_file=$1

# Set the partition variables
loopdevice=`losetup -f --show ${img_file}`
device=`kpartx -va $loopdevice| sed -E 's/.*(loop[0-9])p.*/\1/g' | head -1`
device="/dev/mapper/${device}"
bootp=${device}p1
rootp=${device}p2

echo "Please Wait a moment..."
sleep 5

mkdir -p b$2 r$2
mount $bootp b$2
mount $rootp r$2

