#!/bin/bash
#
ip address add 192.168.1.55/24 broadcast + dev eno1
ip link set eno1 up
ip route add 192.168.1.0/24 dev eno1
ip route add default via 192.168.1.1 dev eno1
echo "nameserver 192.168.10.53" >> /etc/resolv.conf
