#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

ip route change 192.168.2.0/24 via 10.0.0.2 dev vmbr1
