#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. $SCRIPT_DIR/env.ini

mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS < $SCRIPT_DIR/mysql/slow_query.sql
