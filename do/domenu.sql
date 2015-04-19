/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-12
File name:      domenu.sql

Description:
Oradistrict Toolbox - Startup script for: Database objects

*/
clear screen
prompt 
prompt > > Database objects
prompt 
prompt Chose report:
prompt 
prompt 1)  Objects
prompt 2)  Constraints
prompt 3)  Directories
prompt 
prompt 0)  back to previous menu (*)
prompt 
prompt Default value always with (*)

accept acc_choice number default 0 prompt 'Input your choice: '

set termout off
variable category_menu varchar2(40)
declare
begin
  select decode (&acc_choice,
         1, 'do/object112.sql',
         2, 'do/constraint112.sql',
         3, 'do/directory112.sql',
         0, 'odstart.sql',
         'odstart.sql')
    into :category_menu
    from dual;
end;
/
col acc_scriptname new_value col_scriptname noprint
select :category_menu acc_scriptname
  from dual;
set termout on

start &col_scriptname
