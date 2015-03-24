/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-24
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
         1, decode (substr('&1', 1, 2), '12', 'sap/mysession121.sql',
                                              'sap/mysession112.sql'),
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
