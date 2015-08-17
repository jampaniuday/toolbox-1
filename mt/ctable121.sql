/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-17
File name:      ctable121.sql

Description:
Oradistrict Toolbox - List of tables owned by pointed user.

*/

start mt/ctablefmt.sql

prompt
prompt Add %% if needed for owner name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input objects owner: '

prompt Tables with owner LIKE &acc_username

select c.name, t.table_name, t.tablespace_name
  from cdb_tables t, v$containers c
 where t.con_id = c.con_id
   and upper(t.owner) like upper('&acc_username')
 order by c.name, t.table_name;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
