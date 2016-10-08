#/bin/bash

if [[ $# -eq 0 ]] ; then
    echo "Please enter sd card device info, e.g. /dev/sdb or sdb"
    exit 0
fi

bootdev="$1"1
rootdev="$1"2
size=`df -B MB --output=source,target,used | grep $rootdev | awk '{print $3}' | awk -F "MB" '{print $1}'`
org_bootp=`df --output=source,target | grep $bootdev | awk '{print $2}'`
org_rootp=`df --output=source,target | grep $rootdev | awk '{print $2}'`

if [[ $org_bootp == "" ]] ; then
    echo "boot target not found "
    exit 0
fi
if [[ $org_rootp == "" ]] ; then
    echo "root target not found "
    exit 0
fi

