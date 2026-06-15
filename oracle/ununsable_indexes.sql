SET      pagesize 0
SET      heading OFF
SET      feedback OFF
SET	 verify OFF
select count(1) FROM dba_indexes where status='UNUSABLE' and owner not in ('SYS', 'SYSTEM', 'GSMADMIN_INTERNAL', 'WMSYS', 'XDB', 'DBSNMP', 'APPQOSSYS', 'OUTLN', 'DBSFWUSER', 'AUDSYS');
QUIT;