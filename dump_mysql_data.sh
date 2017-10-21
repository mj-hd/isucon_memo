#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

. $SCRIPT_DIR/env.ini

FILE=mysql_dump_data

backup $FILE
mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS $DB_NAME > $FILE
