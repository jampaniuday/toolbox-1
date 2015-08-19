/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-19
File name:      cprivilege121.sql

Description:
Oradistrict Toolbox - List of privileges granted to pointed user.

*/

start mt/cprivilegefmt.sql

prompt
prompt Key for column names
prompt C - common privilege?
prompt AO - admin option granted?
prompt
prompt Add %% if needed for grantee name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input grantee name: '

prompt Privileges and roles granted to LIKE &acc_username

select c.name, p.grantee, p.privilege,
       decode(p.admin_option, 'YES', 'Y', 'NO', 'N', '-') admin_option,
       decode(p.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_sys_privs p, v$containers c
 where p.con_id = c.con_id
   and upper(p.grantee) like upper('&acc_username')
 order by c.name, p.privilege;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
