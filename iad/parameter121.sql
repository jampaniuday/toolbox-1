/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-24
File name:      parameter121.sql

Description:
Oradistrict Toolbox - database parameter value - only for currently connected container or database.
Only for passed parameter name (with like and lower function).

*/

start iad/parameterfmt.sql

prompt 
prompt Key for column names
prompt IsD - is default value?
prompt IsPM - is modifiable in pluggable database?
prompt IsS - is specified in spfile?
prompt Add %% if needed for parameter name. Search is case insensitive.
prompt 

accept acc_parameter char default '%cursor%' prompt 'Input system parameter name for like search: '

prompt 
prompt 1 - System parameter for LIKE with argument &acc_parameter
prompt (active instance parameters)
select decode(c.name,null,'GLOBAL (conid=0)',c.name) pdb_name,
       p.name, p.value, decode(p.isdefault,'TRUE','T','FALSE','F','F') isdefault,
       decode(p.ispdb_modifiable,'TRUE','T','FALSE','F','F') ispdb_modifiable
  from v$containers c, v$system_parameter p
 where c.con_id (+) = p.con_id 
   and lower(p.name) like lower('&acc_parameter')
 order by c.con_id asc, p.name asc;

col isspecified for a3 hea 'IsS'
col ordinal for 999 hea 'Ord'
prompt 
prompt 2 - Server Parameter File information for LIKE with argument &acc_parameter
select decode(c.name,null,'GLOBAL (conid=0)',c.name) pdb_name,
       p.name, p.ordinal, p.value, decode(p.isspecified,'TRUE','T','FALSE','F','F') isspecified
  from v$containers c, v$spparameter p
 where c.con_id (+) = p.con_id
   and lower(p.name) like lower('&acc_parameter')
 order by c.con_id asc, p.name asc, p.ordinal asc;

set verify on

prompt
prompt (hit enter to continue)
pause

start iad/iadmenu.sql
