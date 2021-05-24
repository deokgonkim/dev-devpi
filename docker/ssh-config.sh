#!/bin/bash

mkdir /run/sshd

echo PermitRootLogin yes >> /etc/ssh/sshd_config

chmod 600 /root/.ssh/authorized_keys
