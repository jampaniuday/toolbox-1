/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-12
File name:      object112.sql

Description:
Oradistrict Toolbox - List constraints from pointed owner.

*/

start do/objectfmt.sql

prompt
prompt Add %% if needed for owner name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input objects owner: '

prompt Objects with owner LIKE &acc_username

select object_type, object_name, created, status
  from dba_objects
 where upper(owner) like upper('&acc_username')
 order by owner, object_type, object_name;

set verify on

prompt
prompt (hit enter to continue)
pause

start do/domenu.sql
