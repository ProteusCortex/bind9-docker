#!/bin/sh

if [ -f /etc/bind/rndc.key ]; then
        rm -rf /etc/bind/rndc.key
fi

rndc-confgen > /etc/rndc.conf && head -n 5 /etc/rndc.conf | tail -n 4 > /etc/bind/rndc.key

exec /usr/bin/tini -- /usr/sbin/named -g -c /etc/bind/named.conf -u bind
