#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. $SCRIPT_DIR/env.ini

ssh $SSH_USER@$SSH_HOST "sudo iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT"
