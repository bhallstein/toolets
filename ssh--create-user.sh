#!/bin/bash
#
# Invoke:
#
#  LC_USER=x
#  LC_PWD=y
#  LC_PUBLIC_KEY=$(cat ~/.ssh/z)
#  export LC_USER
#  export LC_PWD
#  export LC_PUBLIC_KEY
#
#  ssh -o SendEnv=LC_USER -o SendEnv=LC_PWD -o SendEnv=LC_PUBLIC_KEY \
#    root@xxx.xxx.xxx.xxx \
#    < ssh--create-user.sh
#

set -e

echo 'ssh--create-user.sh'

arg_error() {
  echo 'These environment variables must be set: LC_USER, LC_PWD, LC_PUBLIC_KEY'
  exit 1
}

if [ -z "$LC_USER"       ]; then arg_error; fi
if [ -z "$LC_PWD"        ]; then arg_error; fi
if [ -z "$LC_PUBLIC_KEY" ]; then arg_error; fi


groupadd $LC_USER
useradd --create-home \
  --shell /bin/bash \
  -g $LC_USER -G sudo \
	$LC_USER
echo "$LC_USER:$LC_PWD" | chpasswd


mkdir -p /home/$LC_USER/.ssh
echo $LC_PUBLIC_KEY > /home/$LC_USER/.ssh/authorized_keys


sed -i -E 's/.*AddressFamily.*//' /etc/ssh/sshd_config
echo "AddressFamily inet" >> /etc/ssh/sshd_config


service sshd restart

