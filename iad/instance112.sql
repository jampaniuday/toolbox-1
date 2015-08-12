/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-11
File name:      instance112.sql

Description:
Oradistrict Toolbox - Instance report.

*/

start iad/instancefmt.sql

select instance_number, instance_name, host_name, startup_time,
       floor(sysdate - startup_time) up_for_days
  from v$instance;

select status, version, logins, thread#, archiver, log_switch_wait, shutdown_pending
  from v$instance;

select instance_role, active_state, blocked
  from v$instance;

prompt 
prompt (hit enter to continue)
pause

start ex.sql
