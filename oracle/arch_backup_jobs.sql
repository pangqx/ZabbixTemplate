SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(1) FROM V$RMAN_BACKUP_JOB_DETAILS where END_TIME>=sysdate-1 and INPUT_TYPE='ARCHIVELOG' and STATUS like 'COMPLETED%';
QUIT;