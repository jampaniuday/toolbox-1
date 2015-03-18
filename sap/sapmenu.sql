/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-18
File name:      sapmenu.sql

Description:
Oradistrict Toolbox - Startup script for: sessions and processes

*/
clear screen
prompt 
prompt > > Sessions and processes
prompt 
prompt Chose report:
prompt 
prompt 1)  my session - basic information
--prompt 2)  database status (v$database)
--prompt 3)  non-default parameters (v$parameter)
--prompt 4)  specified parameters (v$sparameter)
--prompt 5)  memory (sga/pga/buffers)
--prompt 6)  long session operations (v$session_longops)
--prompt 7)  
prompt 
prompt 0)  back to previous menu (*)
prompt 
prompt Default value always with (*)

accept acc_choice number default 0 prompt "Input your choice: "

set termout off
variable category_menu varchar2(40)
declare
begin
  select decode (&acc_choice,
         1, decode (substr('&1', 1, 2), '12.1', 'iad/mysession121.sql',
                                                'iad/mysession112.sql'),
--         2, decode ('&1', '12.1.0.2', 'iad/database12102.sql',
--                    '&1', '12.1.0.1', 'iad/database12101.sql',
--                                      'iad/database112.sql'),
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
