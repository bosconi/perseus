#!/bin/bash

etcd1=$(getent hosts etcd1 | awk '{ print $1 }')
etcd2=$(getent hosts etcd2 | awk '{ print $1 }')
etcd3=$(getent hosts etcd3 | awk '{ print $1 }')

myip=$(getent hosts $(hostname) | awk '{ print $1 }')

python -c "for ip in (set(['$etcd1', '$etcd2', '$etcd3']) - set(['$myip'])): print ip" | xargs -I '{}' iptables -A INPUT -s '{}' -j DROP
python -c "for ip in (set(['$etcd1', '$etcd2', '$etcd3']) - set(['$myip'])): print ip" | xargs -I '{}' iptables -A OUTPUT -d '{}' -j DROP
