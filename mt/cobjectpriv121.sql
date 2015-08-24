/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-24
File name:      cobjectpriv121.sql

Description:
Oradistrict Toolbox - List of privileges on objects granted to pointed user.

*/

start mt/cobjectprivfmt.sql

prompt
prompt Key for column names
prompt C - common privilege?
prompt G - grant option added?
prompt H - hierarchy?
prompt
prompt Add %% if needed for grantee name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input grantee name: '

prompt Privileges granted on objects to LIKE &acc_username

select c.name container_name, p.grantee, /*p.grantor,*/ p.owner,
       p.table_name object_name, p.privilege,
       decode(p.grantable, 'YES', 'Y', 'NO', 'N', '-') grantable,
       decode(p.hierarchy, 'YES', 'Y', 'NO', 'N', '-') hierarchy,
       decode(p.common,'YES', 'Y', 'NO', 'N', '-') common,
       type
  from cdb_tab_privs p, v$containers c
 where p.con_id = c.con_id
   and upper(p.grantee) like upper('&acc_username')
 order by c.name, p.grantee, p.owner, p.table_name, p.privilege;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
