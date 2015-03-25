/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-25
File name:      tsmenu.sql

Description:
Oradistrict Toolbox - Startup script for: Tablespaces (with data and temp files)

*/
clear screen
prompt 
prompt > > Tablespaces (with data and temp files)
prompt 
prompt Chose report:
prompt 
prompt 1)  tablespaces with data and temp files
--prompt 2)  
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
         1, decode (substr('&1', 1, 2), '12', 'ts/datatempfiles121.sql',
                                              'ts/datatempfiles112.sql'),
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
