/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-10
File name:      iadmenu.sql

Description:
Oradistrict Toolbox - Startup script for: instance and database (parameters and status)

*/
clear screen
prompt 
prompt > > Instance and database (parameters and status)
prompt 
prompt Chose report:
prompt 
prompt 1)  instance status (v$instance)
prompt 2)  database status (v$database)
prompt 3)  non-default parameters (v$parameter)
prompt 4)  specified parameters (v$sparameter)
--prompt 5)  memory (sga/pga/buffers)
--prompt 6)  long session operations (v$session_longops)
-- prompt 7)  
prompt 
prompt 0)  back to previous menu (*)
prompt 
prompt Default value always with (*)

accept acc_choice number default 0 prompt "Input your choice: "

set termout off
variable category_menu varchar2(30)
declare
begin
  select decode (&acc_choice, 1, 'iad/instance.sql',
                              2, decode(&1, '12.1', 'iad/database121.sql', 'iad/database.sql'),
                              3, 'iad/nondefparams.sql',
                              4, 'iad/spparams.sql',
                              5, 'iad/memory.sql',
                              --6, 'iad/longsesoper.sql',
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
