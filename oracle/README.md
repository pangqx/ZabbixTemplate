## zabbix oracle templates

### macros
| Macro | Value |
| ----------- | ----------- |
| $ORACLE.TBS.USED.PCT.MAX.WARN | 85 |
| $ORACLE.TBS.USED.PCT.MAX.HIGH | 95 |
| $ORACLE.DATAGUARD.APPLAG.WARN | 10 |
| $ORACLE.DATAGUARD.APPLAG.HIGH | 60 |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |
| $ |  |


---

### Item
  - **Name**: Oracle数据库表空间使用率：<表空间名>
  - **Type of information**: Numeric(float)
  - **Units**: %
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库表空间使用率 (<表空间名>：大于{\$ORACLE.TBS.USED.PCT.MAX.WARN}，实例：{$ORACLE.SERVICE})
  - **Severity**: Warning
  - **Expression**:  
  <br>
  - **Name**: Oracle数据库表空间使用率 (<表空间名>：大于{\$ORACLE.TBS.USED.PCT.MAX.HIGH}，实例：{$ORACLE.SERVICE})
  - **Severity**: High
  - **Expression**:

### Script
  - tbs_used_pct.sql
---

### Item
  - **Name**: Oracle数据库备库同步延迟
  - **Type of information**: Numeric(unsigned)
  - **Units**: min
  - **Update interval**: 5m

### Trigger

  - **Name**: Oracle数据库备库同步延迟大于{\$ORACLE.DATAGUARD.APPLAG.WARN}分钟，实例：{$ORACLE.SERVICE}
  - **Severity**: Warning
  - **Expression**: 
<br>
  - **Name**: Oracle数据库备库同步延迟大于{\$ORACLE.DATAGUARD.APPLAG.HIGH}分钟，实例：{$ORACLE.SERVICE}
  - **Severity**: High
  - **Expression**: 

### Script
  - apply_lag.sql
---



