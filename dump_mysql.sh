#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

. $SCRIPT_DIR/env.ini

FILE=mysql_dump

backup $FILE
mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USER -p$DB_PASS --compact --no-data $DB_NAME | grep -v "^SET" | grep -v "^/\*\!" | perl -ple 's@CREATE TABLE @\nCREATE TABLE @g' > $FILE
