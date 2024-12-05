SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select round(100*CURRENT_UTILIZATION/LIMIT_VALUE,2) from V$resource_limit where resource_name='processes';
QUIT;
