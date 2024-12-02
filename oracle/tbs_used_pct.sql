SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
SELECT D.TABLESPACE_NAME, ROUND((1-NVL(FREE_SPACE,0)/SPACE)*100,2) "USED_RATE(%)"
FROM
(SELECT TABLESPACE_NAME,ROUND(SUM(BYTES)/(1024*1024),2) SPACE,SUM(BLOCKS) BLOCKS
FROM DBA_DATA_FILES WHERE TABLESPACE_NAME <>'UNDOTBS1'
GROUP BY TABLESPACE_NAME) D,
(SELECT TABLESPACE_NAME,ROUND(SUM(BYTES)/(1024*1024),2) FREE_SPACE
FROM DBA_FREE_SPACE
GROUP BY TABLESPACE_NAME) F
WHERE  D.TABLESPACE_NAME = F.TABLESPACE_NAME(+)
union all
select a.tablespace,round(100*sum(sum_block*b.block_size/1024/1024/c.sum),2) as used_percent 
from (select tablespace,sum(sum_blocks) as sum_block from (select TABLESPACE,nvl(sum(blocks),0) as sum_blocks from V$tempseg_usage group by tablespace union all select 'TEMP',0 from dual) group by tablespace) a,
(select block_size from dba_tablespaces where rownum=1 ) b,
(select tablespace_name,sum(bytes/1024/1024) as sum from dba_temp_files group by tablespace_name ) c
where a.tablespace=c.tablespace_name
group by a.tablespace
union all
select b.tablespace_name,round(100*a.sum_a/b.sum_b,2) from
(SELECT TABLESPACE_NAME,SUM(sum_a) as sum_a FROM (select TABLESPACE_NAME,sum(bytes/1024/1024) as sum_a from   dba_undo_extents where status='ACTIVE'  group by tablespace_name  union all select 'UNDOTBS1',0 FROM DUAL) GROUP BY TABLESPACE_NAME) a 
left join
(select tablespace_name,sum(bytes/1024/1024) as sum_b from dba_data_files where tablespace_name like 'UNDO%' group by tablespace_name) b
on a.tablespace_name=b.tablespace_name;
QUIT;
