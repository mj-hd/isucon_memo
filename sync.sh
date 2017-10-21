#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. $SCRIPT_DIR/env.ini

backup $LOCAL_DIR
rsync -rLhv $SSH_USER@$SSH_HOST:$REMOTE_DIR/ $LOCAL_DIR
