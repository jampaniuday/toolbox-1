/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-16
File name:      cusersonm121.sql

Description:
Oradistrict Toolbox - List all Oracle non-managed users in CDB.

*/

start mt/cusersfmt.sql

prompt
prompt Key for column names
prompt C - Common user
prompt 
prompt ~~ all users ~~

prompt ~~ only non-system users (non oracle maintained) ~~

select c.con_id, c.name con_name, u.user_id, u.username,
       u.account_status, decode(u.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_users u, v$containers c
 where u.con_id = c.con_id
   and u.oracle_maintained != 'Y'
 order by c.con_id, u.user_id;

prompt
prompt (hit enter to continue)
pause

start ex.sql
