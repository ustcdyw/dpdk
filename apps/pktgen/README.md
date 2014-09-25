
Usage
=====

Prepare the DPDK environment

	sudo tools/prepare.sh

Build and run this application

	make RTE_SDK=/path/to/dpdk-sdk RTE_TARGET=build
	sudo ./pktgen -c fff -n 4 -- -c config -b 1 -f tx              # Send udp packet
	sudo ./pktgen -c fff -n 4 -- -c config -b 1 -f tx -t tracelist # Send tcp packet from pcap file.
	sudo ./pktfen -c fff -n 4 -- -c config -b 1 -f rx


TODO
====

- Add sanity_check() after parse_args()
    -c and -f tx
    -l and -f tx

- Add a description of the correctness of send logic.
  (order and no drop)

- Add -c count (Hard to implement to keep code clean and high performance)

- Understand RSS.
- Understand memory channel.


ChangeLog
=========

- Add '-t trace list file' option to specify the pcap file to be sent.

- Add '-p packet size' (udp packet length) option

- Add '-b burst size' option

- Add '-l loop count' option to provide the method to slow tx speed down.

- Correct the calculation of sent and received bytes.

- Add '-i interval' option to specify the interval of updating stats.

- Add sanity_check() which will be called after parse_args() to check the
  correctness of arguments specified through the command line.

- Add -c option to setup the cores configuration by reading
  from configuration file. Configuration file format likes this:

    #
    # There are six cores and two ports are used.
    # And there are three queues are enabled for each port.
    #

    # Settings for NIC-0
    core_id=0,port_id=0,queue_id=0 # Cpu0 manages the queue 0 of NIC-0
    core_id=1,port_id=0,queue_id=1
    core_id=2,port_id=0,queue_id=2

    # Settings for NIC-1
    core_id=3,port_id=1,queue_id=0
    core_id=4,port_id=1,queue_id=1
    core_id=5,port_id=1,queue_id=2

  Empty line and comments (Anything after #) are supported.


NOTICE
======

To replay tcp, all packets in pcap should be sent in order correctly,
so, pcap files should be sent in correct order.


All enjoyable things
====================

1. The high speed of sending and receiving packets;
2. The correctness of each number (number of packets and bytes);
3. The human friendly information and statistics;


The experience can be got
=========================

1. Maybe only a few codes, then a wonderful function will be got.
2. Make a excellent framework, then everything can benefit from it
   easily and naturally.

PS. I love to write codes.


Elegant source code (code architecture and effeciency), handy command
line argments and outputs -- Wonderful using experience.

