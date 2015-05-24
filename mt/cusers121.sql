/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-05-24
File name:      cusers121.sql

Description:
Oradistrict Toolbox - List all users in CDB.

*/

start mt/cusersfmt.sql

prompt
prompt Key for column names
prompt C - Common user
prompt OM - Oracle Maintained
prompt 
prompt ~~ all users ~~

select c.name con_name, u.username, u.account_status, u.created,
       decode(u.common,'YES', 'Y', 'NO', 'N', '-') common, u.oracle_maintained
  from cdb_users u, v$containers c
 where u.con_id = c.con_id
 order by c.con_id, u.user_id;


prompt ~~ only non-system users (non oracle maintained) ~~

select c.name con_name, u.username, u.account_status, u.created,
       decode(u.common,'YES', 'Y', 'NO', 'N', '-') common, u.oracle_maintained
  from cdb_users u, v$containers c
 where u.con_id = c.con_id
   and u.oracle_maintained != 'Y'
 order by c.con_id, u.user_id;


prompt
prompt (hit enter to continue)
pause

start mt/mtmenu.sql
