#!/bin/sh
echo "$1" > /etc/hostname
hostname -F /etc/hostname
cat >/etc/hosts<<EOF
127.0.0.1 localhost
127.0.1.1 $1
212.71.250.182 salt

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
curl -L http://bootstrap.saltstack.org | sudo sh
