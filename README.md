
Usage
=====

Build DPDK

	make config T=x86_64-native-linuxapp-gcc
	make

Prepare DPDK Environment (linux)

	modprobe uio
	insmod build/kmod/igb_uio.ko
	./tools/dpdk_nic_bind.py --status
	./tools/dpdk_nic_bind.py -b igb_uio 07:00.0 07:00.1 # Get from --status

PS. To restore: ./tools/dpdk_nic_bind.py -b ixgbe 07:00.0 07:00.1

	mkdir -p /mnt/huge
	mount -t hugetlbfs nodev /mnt/huge
	echo 64 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages

