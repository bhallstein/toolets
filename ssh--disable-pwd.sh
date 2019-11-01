#!/bin/bash
#
# Invoke:
#
#  ssh root@xxx.xxx.xxx.xxx < ssh--disable-pwd.sh
#

set -e

echo 'ssh--disable-pwd.sh'


sed -i -E 's/.*PasswordAuthentication.*//' /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config


service sshd restart

