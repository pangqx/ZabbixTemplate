SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(1) from V$RMAN_BACKUP_JOB_DETAILS where END_TIME>=sysdate-1 and status='FAILED';
QUIT;