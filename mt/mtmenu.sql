/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-12
File name:      mtmenu.sql

Description:
Oradistrict Toolbox - Startup script for: multitenant option

*/
clear screen
prompt 
prompt > > Multitenant (container database)
prompt 
prompt Chose report:
prompt 
prompt 1)  containers
prompt 2)  containers database properties
prompt 3)  containers (status and logging)
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
         1, decode (substr('&1', 1, 2), '12', 'mt/container121.sql',
                                              'notavailable.sql'),
         2, decode (substr('&1', 1, 2), '12', 'mt/cdatabaseproperties121.sql',
                                              'notavailable.sql'),

         3, decode ('&1', '12.1.0.1', 'mt/pdb12101.sql',
                    decode (substr('&1', 1, 2),
                            '12', 'mt/pdb12102.sql',
                            'notavailable.sql')
                   ),
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
