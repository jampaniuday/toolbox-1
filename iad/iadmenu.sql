/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-16
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
prompt 1)  instance status
prompt 2)  database status
prompt 3)  database properties
prompt 4)  specified parameter
--prompt 3)  non-default parameters (v$parameter)
--prompt 5)  memory (sga/pga/buffers)
--prompt 6)  long session operations (v$session_longops)
--prompt 7)  
prompt 
prompt 0)  back to previous menu (*)
prompt 
prompt Default value always with (*)

accept acc_choice number default 0 prompt 'Input your choice: '

set termout off
variable category_menu varchar2(40)
declare
begin
--                              3, 'iad/nondefparams.sql',
--                              4, 'iad/spparams.sql',
--                              5, 'iad/memory.sql',
--                              6, 'iad/longsesoper.sql',
--                              0, 'odstart.sql',
--                                 'odstart.sql')
  select decode (&acc_choice,
         1, decode (substr('&1', 1, 4), '12.1', 'iad/instance121.sql',
                                                'iad/instance112.sql'),
         2, decode ('&1', '12.1.0.2', 'iad/database12102.sql',
                    '&1', '12.1.0.1', 'iad/database12101.sql',
                                      'iad/database112.sql'),
         3, 'iad/databaseproperties.sql',
         4, decode (substr('&1', 1, 4), '12.1', 'iad/parameter121.sql',
                                                'iad/parameter112.sql'),
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
