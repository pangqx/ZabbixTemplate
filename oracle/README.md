## zabbix oracle templates

### macros
| Macro | Value |
| ----------- | ----------- |
| $ORACLE.TBS.USED.PCT.MAX.WARN | 85 |
| $ORACLE.TBS.USED.PCT.MAX.HIGH | 95 |
| $ORACLE.DATAGUARD.APPLAG.WARN | 10 |
| $ORACLE.DATAGUARD.APPLAG.HIGH | 60 |
| $ORACLE.PROC.USED.PCT.WARN | 85 |
| $ORACLE.PROC.USED.PCT.HIGH | 95 |



---

### Item
  - **Name**: Oracle数据库表空间使用率：<表空间名>
  - **Type of information**: Numeric(float)
  - **Units**: %
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库表空间使用率 (<表空间名>：大于{$ORACLE.TBS.USED.PCT.MAX.WARN}，实例：{$ORACLE.SERVICE})
  - **Severity**: Warning
  - **Expression**:    
<br>
  
  - **Name**: Oracle数据库表空间使用率 (<表空间名>：大于{$ORACLE.TBS.USED.PCT.MAX.HIGH}，实例：{$ORACLE.SERVICE})
  - **Severity**: High
  - **Expression**:

### Script
  - get_tbs_pct_info.sql
---

### Item
  - **Name**: Oracle数据库备库同步延迟
  - **Type of information**: Numeric(unsigned)
  - **Units**: min
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库备库同步延迟大于{$ORACLE.DATAGUARD.APPLAG.WARN}分钟，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 
<br>
  
  - **Name**: Oracle数据库备库同步延迟大于{$ORACLE.DATAGUARD.APPLAG.HIGH}分钟，实例：{$ORACLE.SERVICE}
  - **Severity**: High
  - **Expression**: 

### Script
  - apply_lag.sql
---

### Item
  - **Name**: Oracle数据库进程使用率
  - **Type of information**: Numeric(float)
  - **Units**: %
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库进程使用率大于{$ORACLE.PROC.USED.PCT.WARN}，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 
<br>
  
  - **Name**: Oracle数据库进程使用率大于{$ORACLE.PROC.USED.PCT.HIGH}，实例：{$ORACLE.SERVICE}
  - **Severity**: High
  - **Expression**: 

### Script
  - db_usedprocs_pct.sql
---

### Item
  - **Name**: Oracle数据库锁冲突数量
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库锁冲突数量大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_lock_conflicts.sql
---

### Item
  - **Name**: Oracle数据库失效对象数量
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库失效对象数量大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_invalid.sql
---

### Item
  - **Name**: Oracle数据库最近一天备份失败任务数量
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 1d

### Trigger

  - **Name**: Oracle数据库最近一天备份失败任务数量大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_backup_jobs.sql
---

### Item
  - **Name**: Oracle数据库开启并行的表数量
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库开启并行的表数量大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_parallel_tables.sql
---

### Item
  - **Name**: Oracle数据库开启并行的索引数量
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库开启并行的索引数量大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_parallel_indexes.sql
---

### Item
  - **Name**: Oracle数据库内存变动出现错误次数
  - **Type of information**: Numeric(unsigned)
  - **Units**: 
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库内存变动出现错误次数大于0，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 

### Script
  - db_memory_resize_ops.sql
---