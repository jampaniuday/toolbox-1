/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-08
File name:      instance.sql

Description:
Oradistrict Toolbox - Instance report.

*/

set heading on

col instnace_number for 999999 hea 'Inst. num.'
col instance_name for a13 hea 'Instance name'
col host_name for a24 hea 'Host name'
col version for a12 hea 'Version'
col startup_time for a19 hea 'Startup time'
col status for a12 hea 'Status'
col up_for_days for 999999 hea 'Days UP'
col logins for a10 hea 'Logins'
col thread# for 99999 hea 'Thread'
col archiver for a8 hea 'Archiver'
col log_switch_wait for a15 hea 'Log switch wait'
col shutdown_pending for a14 hea 'Shutdown pend.'
col instance_role for a18 hea 'Instance role'
col active_state for a12 hea 'Active state'
col blocked for a7 hea 'Blocked'
col con_id for 99999999999 hea 'Container ID'
col instance_mode for a15 hea 'Instance mode'
col edition for a10 hea 'DB edition'

select instance_number, instance_name, host_name, startup_time,
       floor(sysdate - startup_time) up_for_days
  from v$instance;

select status, version, logins, thread#, archiver, log_switch_wait, shutdown_pending
  from v$instance;

select instance_role, active_state, blocked, con_id, instance_mode, edition
  from v$instance;

prompt 
prompt (hit enter to continue)
pause

start iad/iadmenu.sql
