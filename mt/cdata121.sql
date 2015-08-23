/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-22
File name:      cdata121.sql

Description:
Oradistrict Toolbox - List of container data for pointed user.

*/

start mt/cdatafmt.sql

prompt
prompt Key for column names
prompt D - default attribute
prompt AC - all containers
prompt
prompt Add %% if needed for user name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input user name: '

prompt Container data granted to user LIKE &acc_username

select d.container_name, d.username, d.default_attr, d.owner, d.object_name, d.all_containers
  from cdb_container_data d
 where upper(d.username) like upper('&acc_username')
 order by d.container_name, d.username, d.owner, d.object_name;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
