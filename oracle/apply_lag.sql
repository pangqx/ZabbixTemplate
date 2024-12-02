SET pagesize 0
SET heading OFF
SET feedback OFF
SET verify OFF
select to_number(substr(value,2,2))*1440 + to_number(substr(value,5,2))*60 + to_number(substr(value,8,2)) min_cnt from v$dataguard_stats where name='apply lag';
QUIT;