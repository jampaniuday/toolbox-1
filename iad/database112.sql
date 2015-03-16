/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0
Last date:      2015-03-16
File name:      database112.sql

Description:
Oradistrict Toolbox - Database report.

*/

start iad/databasefmt.sql

select dbid, name, created, current_scn, log_mode
  from v$database;

select open_mode, controlfile_type, controlfile_created, protection_mode, protection_level
  from v$database;

select database_role, switchover_status, dataguard_broker, force_logging, flashback_on
  from v$database;
prompt 
prompt (hit enter to continue)
pause

start iad/iadmenu.sql
