#!/bin/bash
#
# Invoke:
#
#  ssh root@xxx.xxx.xxx.xxx < ssh/ssh--disable-root.sh
#

echo 'ssh--disable-root.sh'

sed -i -E 's/.*PermitRootLogin.*//' /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config

service sshd restart
