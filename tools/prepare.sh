#!/bin/sh
# vim:set ts=4:

RTE_SDK='/home/nfs/btw/dpdk'
PAGE_NR=256

for i in `lsmod | grep ixgbe | awk '{print $1}'`; do
	rmmod $i
done

cd $RTE_SDK
modprobe uio
if (! (lsmod | grep -q igb_uio)); then
	insmod build/kmod/igb_uio.ko
fi

cd /sys/module/igb_uio/drivers/pci:igb_uio
NICS=`echo *:*:*.*`  # Can also be got by ./igb_uio_bind.py --status
echo "NICS: $NICS"

cd $RTE_SDK
echo
./tools/igb_uio_bind.py -b igb_uio $NICS

if (mount | grep -q hugetlbfs); then
	umount `mount | grep hugetlbfs | awk '{print $3}'`
fi

echo "Reserve $PAGE_NR 2MB pages. (total size: `echo $PAGE_NR \* 2 | bc`MB)"
mount -t hugetlbfs nodev /mnt/huge
echo $PAGE_NR > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages

