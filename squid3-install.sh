#!/bin/bash

# Squid Proxy Remote SHH Installer
# Author: https://www.kode27.com
# Email: info@kode27.com
# Github: https://github.com/kode27/squid-proxy-remote-installer

export DEBIAN_FRONTEND=noninteractive
if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04"; then
	echo "Ubuntu 18.04"
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid3
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" service squid restart
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 16.04"; then
	echo "Ubuntu 16.04"
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid3
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" service squid restart
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" update-rc.d squid defaults
elif cat /etc/*release | grep DISTRIB_DESCRIPTION | grep "Ubuntu 14.04"; then
	echo "Ubuntu 14.04"
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid3
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid3/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid3/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid3/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" service squid3 restart
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" ln -s /etc/squid3 /etc/squid
    #update-rc.d squid3 defaults
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "jessie"; then
    # OS = Debian 8
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -rf /etc/squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid3
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid3/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid3/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid3/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" service squid3 restart
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" update-rc.d squid3 defaults
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "stretch"; then
    # OS = Debian 9
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -rf /etc/squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl enable squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl restart squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "buster"; then
    # OS = Debian 10
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -rf /etc/squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt update
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/apt -y install apache2-utils squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" touch /etc/squid/passwd
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /bin/rm -f /etc/squid/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/touch /etc/squid/blacklist.acl
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/kode27/squid-proxy-remote-installer/master/squid.conf
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" /sbin/iptables-save
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl enable squid
    sudo DEBIAN_FRONTEND="$DEBIAN_FRONTEND" systemctl restart squid
else
    echo "OS NOT SUPPORTED.\n"
    echo "Contact info@kode27.com to add support for your os."
    exit 1;
fi
