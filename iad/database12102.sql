/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-11
File name:      database121.sql

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

select supp_log_type, supp_log
  from (
select 'Supplemental log data minimal' supp_log_type,
       supplemental_log_data_min supp_log from v$database
 union
select 'Supplemental log data primary key', supplemental_log_data_pk from v$database
 union
select 'Supplemental log data unique index', supplemental_log_data_ui from v$database
 union
select 'Supplemental log data foreign key', supplemental_log_data_fk from v$database
 union
select 'Supplemental log data all columns', supplemental_log_data_all from v$database
 union
select 'Supplemental log data procedural', supplemental_log_data_pl from v$database)
 order by 1;

-- 12
select cdb, con_id, pending_role_change_tasks, con_dbid
  from v$database;

select force_full_db_caching
  from v$database;
prompt
prompt (hit enter to continue)
pause

start ex.sql
