#!/bin/bash
#
# Invoke:
#
#  LC_ROOT_PUBLIC_KEY=$(cat ~/.ssh/x)
#  export LC_ROOT_PUBLIC_KEY
#
#  ssh -o SendEnv=LC_ROOT_PUBLIC_KEY \
#    root@xxx.xxx.xxx.xxx \
#    < ssh--set-root-key.sh
#

set -e

echo 'ssh--set-root-key.sh'

if [ -z "$LC_ROOT_PUBLIC_KEY" ]; then
  echo "LC_ROOT_PUBLIC_KEY is not set. Make sure to set this variable to the value of the root user's public key".
  exit 1
fi


mkdir -p ~/.ssh
echo $LC_ROOT_PUBLIC_KEY >> ~/.ssh/authorized_keys


service sshd restart

