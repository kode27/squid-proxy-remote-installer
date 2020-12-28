#!/bin/bash

# Squid Proxy Remote SHH Installer
# Author: https://www.kode27.com
# Email: info@kode27.com
# Github: https://github.com/kode27/squid-proxy-remote-installer

export DEBIAN_FRONTEND=noninteractive

IP_ALL=$(sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/ip -4 -o addr show scope global | awk '{gsub(/\/.*/,"",$4); print $4}')

IP_ALL_ARRAY=($IP_ALL)

SQUID_CONFIG="\n"

for IP_ADDR in ${IP_ALL_ARRAY[@]}; do
    ACL_NAME="proxy_ip_${IP_ADDR//\./_}"
    SQUID_CONFIG+="acl ${ACL_NAME}  myip ${IP_ADDR}\n"
    SQUID_CONFIG+="tcp_outgoing_address ${IP_ADDR} ${ACL_NAME}\n\n"
done

sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" echo "Updating squid config"

sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" echo -e $SQUID_CONFIG >> /etc/squid/squid.conf

sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" echo "Restarting squid..."

sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl restart squid

sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" echo "Done"
