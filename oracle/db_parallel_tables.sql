SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(*) from dba_tables where trim(degree) not in ('DEFAULT', '1') and owner not in ('SYS', 'SYSTEM', 'GSMADMIN_INTERNAL', 'WMSYS', 'XDB', 'DBSNMP', 'APPQOSSYS', 'OUTLN', 'DBSFWUSER', 'AUDSYS');
QUIT;