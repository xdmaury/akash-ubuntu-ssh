#!/bin/bash

# Configure SSH using the provided value for SSH_PASS
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    (echo $SSH_PASS; echo $SSH_PASS) | passwd root

service ssh start

sleep infinity
