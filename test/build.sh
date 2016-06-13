#!/bin/sh
SERVER_IP=$1
echo "Setting up: $SERVER_IP"

ssh-keygen -R $SERVER_IP
ssh-copy-id root@$SERVER_IP
bundle exec knife solo bootstrap root@$SERVER_IP
