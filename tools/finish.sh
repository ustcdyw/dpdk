#!/bin/sh
# vim:set ts=4:

if (lsmod | grep -q igb_uio); then
	rmmod igb_uio
	rmmod uio
fi

if (mount | grep -q hugetlbfs); then
	umount `mount | grep hugetlbfs | awk '{print $3}'`
fi

