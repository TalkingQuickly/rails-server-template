#!/bin/sh
SERVER_IP=$1
echo "Cleaning SSH Config for: $SERVER_IP"

ssh-keygen -R $SERVER_IP
ssh-copy-id root@$SERVER_IP
