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
prompt D - delegate option
prompt DR - default role
prompt
prompt Add %% if needed for grantee name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input grantee name: '

prompt Privileges granted to LIKE &acc_username

select c.name container_name, p.grantee, p.privilege,
       decode(p.admin_option, 'YES', 'Y', 'NO', 'N', '-') admin_option,
       decode(p.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_sys_privs p, v$containers c
 where p.con_id = c.con_id
   and upper(p.grantee) like upper('&acc_username')
 order by c.name, p.privilege;

prompt Roles granted to user (or role) with name LIKE &acc_username

select c.name container_name, r.grantee, r.granted_role,
       decode(r.admin_option,'YES', 'Y', 'NO', 'N', '-') admin_option,
       decode(r.delegate_option,'YES', 'Y', 'NO', 'N', '-') delegate_option,
       decode(r.default_role,'YES', 'Y', 'NO', 'N', '-') default_role,
       decode(r.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_role_privs r, v$containers c
 where r.con_id = c.con_id
   and upper(r.grantee) like upper('&acc_username')
 order by c.name, r.granted_role, r.grantee;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
