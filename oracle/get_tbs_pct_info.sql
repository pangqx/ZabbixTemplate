SELECT 
    JSON_ARRAYAGG(
        JSON_OBJECT(
            tablespacename VALUE JSON_OBJECT(
                'USED_PCT' VALUE USED_PCT,
                'USED_SIZE' VALUE USED_SIZE,
                'MAX_SIZE' VALUE MAX_SIZE
            )
        )
    ) AS DATA
from (
SELECT a.tablespace_name tablespacename, round(a.current_size - c.free + r.recyclebin_size, 1) "USED_SIZE", round(((a.current_size - c.free + r.recyclebin_size)*100)/a.max_size, 1) "USED_PCT", a.max_size
FROM
(SELECT tablespace_name, SUM(bytes) current_size, SUM(decode(autoextensible, 'NO', bytes, GREATEST(maxbytes, bytes))) max_size FROM dba_data_files x where exists (select 1 from dba_tablespaces y where y.tablespace_name=x.tablespace_name and y.contents='PERMANENT') GROUP BY tablespace_name) a,
(SELECT d.tablespace_name, sum(nvl(b.bytes,0)) free FROM dba_tablespaces d, dba_free_space b WHERE d.tablespace_name = b.tablespace_name(+) GROUP BY d.tablespace_name) c,
(select f.tablespace_name, sum(nvl(g.space*f.block_size, 0)) recyclebin_size from dba_tablespaces f, dba_recyclebin g where f.tablespace_name = g.ts_name(+) group by f.tablespace_name) r
WHERE a.tablespace_name = c.tablespace_name and a.tablespace_name = r.tablespace_name
union all
SELECT a.tablespace_name tablespacename, round(a.current_size - c.free, 1) "USED_SIZE", round(((a.current_size - c.free)*100)/a.max_size, 1) "USED_PCT", a.max_size
FROM
(SELECT tablespace_name, SUM(bytes) current_size, SUM(decode(autoextensible, 'NO', bytes, GREATEST(maxbytes, bytes))) max_size FROM dba_temp_files GROUP BY tablespace_name) a,
(SELECT tablespace_name, free_space free FROM dba_temp_free_space) c
WHERE a.tablespace_name = c.tablespace_name
union all
select a.tablespace_name tablespacename, round(b.used_size, 1) as "USED_SIZE", round(b.used_size/a.max_size*100, 1) as "USED_PCT", a.max_size from 
(SELECT tablespace_name, SUM(bytes) current_size, SUM(decode(autoextensible, 'NO', bytes, GREATEST(maxbytes, bytes))) max_size FROM dba_data_files x where exists (select 1 from dba_tablespaces y where y.tablespace_name=x.tablespace_name and y.contents='UNDO') GROUP BY tablespace_name) a,
(select tablespace_name, sum(bytes) used_size from (select tablespace_name, bytes, status from dba_undo_extents union all select tablespace_name, 0 as bytes, 'ACTIVE' as status from dba_tablespaces where contents='UNDO') where status='ACTIVE' group by tablespace_name) b
where a.tablespace_name=b.tablespace_name
);