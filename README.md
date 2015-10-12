
Usage (Linux)
=============

## Build DPDK

	make config T=x86_64-native-linuxapp-gcc
	make

## Setup DPDK Environment

	modprobe uio
	insmod ./build/kmod/igb_uio.ko
	./tools/dpdk_nic_bind.py --status
	./tools/dpdk_nic_bind.py -b igb_uio 07:00.0 07:00.1 # Get from --status
		# restore: ./tools/dpdk_nic_bind.py -b ixgbe 07:00.0 07:00.1
	mkdir -p /mnt/huge
	mount -t hugetlbfs nodev /mnt/huge
	echo 64 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages


Usage (FreeBSD)
===============

## Build DPDK

	gmake config T=x86_64-native-bsdapp-clang
	gmake

## Setup DPDK Environment

	kenv hw.nic_uio.bdfs=66:0:0,66:0:1
	kldload ./build/kmod/nic_uio.ko
	kenv hw.contigmem.num_buffers=1
	kenv hw.contigmem.buffer_size=1073741824
	kldload ./build/kmod/contigmem.ko

