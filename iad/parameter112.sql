/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0
Last date:      2015-03-24
File name:      parameter112.sql

Description:
Oradistrict Toolbox - database parameter value - only for currently connected container or database.
Only for passed parameter name (with like and lower function).

*/

start iad/parameterfmt.sql

prompt 
prompt Key for column names
prompt IsD - is default value?
prompt IsS - is specified in spfile?
prompt Add %% if needed for parameter name. Search is case insensitive.
prompt 

accept acc_parameter char default '%cursor%' prompt 'Input system parameter name for like search: '

prompt 
prompt 1 - System parameter for LIKE with argument &acc_parameter
prompt (active instance parameters)
select p.name, p.value, decode(p.isdefault,'TRUE','T','FALSE','F','F') isdefault
  from v$system_parameter p
 where lower(p.name) like lower('&acc_parameter')
 order by p.name asc;

col isspecified for a3 hea 'IsS'
col ordinal for 999 hea 'Ord'
prompt 
prompt 2 - Server Parameter File information for LIKE with argument &acc_parameter
select p.name, p.ordinal, p.value, decode(p.isspecified,'TRUE','T','FALSE','F','F') isspecified
  from v$spparameter p
 where lower(p.name) like lower('&acc_parameter')
 order by p.name asc, p.ordinal asc;

set verify on

prompt
prompt (hit enter to continue)
pause

start iad/iadmenu.sql
