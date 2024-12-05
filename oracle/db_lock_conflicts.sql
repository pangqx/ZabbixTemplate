SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(1) from V$lock where block=1;
QUIT;
