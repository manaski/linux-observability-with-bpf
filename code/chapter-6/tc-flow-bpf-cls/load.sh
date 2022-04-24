#!/bin/bash
IFNAME=$1

tc qdisc add dev $IFNAME clsact
tc filter add dev $IFNAME ingress bpf da obj classifier.o sec tc
