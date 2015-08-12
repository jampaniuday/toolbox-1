/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-11
File name:      constraint112.sql

Description:
Oradistrict Toolbox - List constraints from pointed owner.

*/

start do/constraintfmt.sql

prompt
prompt Key for column names
prompt CT - Constraint type:
prompt ..C - Check constraint on a table
prompt ..P - Primary key
prompt ..U - Unique key
prompt ..R - Referential integrity
prompt ..V - With check option, on a view
prompt ..O - With read only, on a view
prompt ..H - Hash expression
prompt ..F - Constraint that involves a REF column
prompt ..S - Supplemental logging
prompt Add %% if needed for owner name. Search is case insensitive.
prompt

accept acc_username char prompt 'Input constraints owner: '

prompt Constraints with owner LIKE &acc_username

select owner, table_name, constraint_name, constraint_type, r_owner,
       r_constraint_name
  from dba_constraints
 where upper(owner) like upper('&acc_username')
 order by owner, table_name, constraint_name;

set verify on

prompt
prompt (hit enter to continue)
pause

start ex.sql
