/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-19
File name:      crole121.sql

Description:
Oradistrict Toolbox - List of roles, roles granted to users and other roles.

*/

start mt/crolefmt.sql

prompt
prompt Key for column names
prompt C - common role?
prompt AO - admin option granted?
prompt D - delegate option
prompt DR - default role
prompt OM - Oracle maintained
prompt
prompt Add %% if needed for owner name. Search is case insensitive.
prompt

accept acc_rolename char prompt 'Input role name: '

prompt Roles with name LIKE &acc_rolename

select c.name container_name, r.role role_name, r.password_required, r.authentication_type,
       decode(r.common,'YES', 'Y', 'NO', 'N', '-') common,
       r.oracle_maintained
  from cdb_roles r, v$containers c
 where r.con_id = c.con_id
   and upper(r.role) like upper('&acc_rolename')
 order by c.name, r.role;

prompt Roles with name LIKE &acc_rolename granted to other users and roles

select c.name container_name, r.grantee, r.granted_role,
       decode(r.admin_option,'YES', 'Y', 'NO', 'N', '-') admin_option,
       decode(r.delegate_option,'YES', 'Y', 'NO', 'N', '-') delegate_option,
       decode(r.default_role,'YES', 'Y', 'NO', 'N', '-') default_role,
       decode(r.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_role_privs r, v$containers c
 where r.con_id = c.con_id
   and upper(r.granted_role) like upper('&acc_rolename')
 order by c.name, r.granted_role, r.grantee;

prompt Privileges granted to role LIKE &acc_rolename

select c.name container_name, p.grantee, p.privilege,
       decode(p.admin_option,'YES', 'Y', 'NO', 'N', '-') admin_option,
       decode(p.common,'YES', 'Y', 'NO', 'N', '-') common
  from cdb_sys_privs p, v$containers c
 where p.con_id = c.con_id
   and upper(p.grantee) like upper('&acc_rolename')
 order by c.name, p.grantee, p.privilege;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
