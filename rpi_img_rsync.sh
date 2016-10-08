

echo "Rsyncing Boot files into image file"
rsync -HPavz -q b/ bootp/

echo "Rsyncing rootfs into image file"
rsync -HPavz -q r/ root/

sync

sleep 10

