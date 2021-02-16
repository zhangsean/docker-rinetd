#!/bin/sh
set -e
echo "0.0.0.0 8000 $1 $2" > /etc/rinetd.conf
echo "logfile /var/log/rinetd.log" >> /etc/rinetd.conf
/usr/sbin/rinetd -f -c /etc/rinetd.conf