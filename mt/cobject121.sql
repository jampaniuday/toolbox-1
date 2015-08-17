/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-17
File name:      cobject121.sql

Description:
Oradistrict Toolbox - List of objects owned by pointed user.

*/

start mt/cobjectfmt.sql

prompt
prompt Add %% if needed for owner name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input objects owner: '

prompt Objects with owner LIKE &acc_username

select c.name, o.object_type, object_name, /*created,*/ status
  from cdb_objects o, v$containers c
 where o.con_id = c.con_id
   and upper(o.owner) like upper('&acc_username')
 order by c.name, o.object_type, o.object_name;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
