SET GLOBAL slow_query_log = 1;
SET GLOBAL slow_query_log_file = '/tmp/mysql-slow.log';
SET GLOBAL long_query_time = 0.0;
FLUSH LOGS;
