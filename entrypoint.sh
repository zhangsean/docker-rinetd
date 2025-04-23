#!/bin/sh
set -e
if [ ! -f /etc/rinetd.conf ]; then
  proto=${4}
  if [ $proto == 'udp' ]; then
    proto=/udp
  fi
  echo "0.0.0.0 ${3:-8000}$proto $1 $2$proto" > /etc/rinetd.conf
  echo "logfile /var/log/rinetd.log" >> /etc/rinetd.conf
fi
/usr/sbin/rinetd -f -c /etc/rinetd.conf
