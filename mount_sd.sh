#/bin/bash

mkdir -p b$1 r$1
mount /dev/sdb1 b$1
mount /dev/sdb2 r$1

