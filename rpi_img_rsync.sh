

echo "Rsyncing Boot files into image file"
rsync -HPavz --progress -q b0/ b1/

echo "Rsyncing rootfs into image file"
rsync -HPavz --progress -q r0/ r1/

sync

sleep 10

