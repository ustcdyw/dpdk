#!/bin/sh

linux()
{
	if (test -e /sys/class/net/xge0/device/numa_node); then
		echo "NUMA-node of xge0: `cat /sys/class/net/xge0/device/numa_node`"
	fi

	if (test -e /sys/class/net/xge1/device/numa_node); then
		echo "NUMA-node of xge1: `cat /sys/class/net/xge1/device/numa_node`"
	fi

	if (test -e /sys/module/igb_uio/drivers/pci:igb_uio); then
		cd /sys/module/igb_uio/drivers/pci:igb_uio
		for B_D_F in *:*:*.*; do
			echo "$B_D_F: `cat $B_D_F/numa_node`"
		done
	fi
}

freebsd()
{
	echo "Not ready"
}

OS=`uname -s`

case $OS in

	Linux)
		linux
		;;

	FreeBSD)
		freebsd
		;;

	*)
		echo "Unsupported system"
		;;
esac

