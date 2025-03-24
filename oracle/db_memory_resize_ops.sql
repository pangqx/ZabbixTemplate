SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(*) from v$memory_resize_ops where end_time > sysdate - 1 and status='ERROR';
QUIT;