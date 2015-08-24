/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-05-11
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
prompt 4)  users
prompt 5)  users with IDs (only non-Oracle managed)
prompt 6)  users with IDs (only non-Oracle managed and local)
prompt 7)  objects owned by pointed user 
prompt 8)  tables owned by pointed user
prompt 9)  privileges and roles granted to specified user (or another role)
prompt 10) privileges and roles granted to specified role
prompt 11) privileges on objects granted to specified user
prompt 12) container data granted to common users
prompt 
prompt 0)  exit (*)
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
         4, decode (substr('&1', 1, 2), '12', 'mt/cusers121.sql',
                                              'notavailable.sql'),
         5, decode (substr('&1', 1, 2), '12', 'mt/cusersonm121.sql',
                                              'notavailable.sql'),
         6, decode (substr('&1', 1, 2), '12', 'mt/cusersonml121.sql',
                                              'notavailable.sql'),
         7, decode (substr('&1', 1, 2), '12', 'mt/cobject121.sql',
                                              'notavailable.sql'),
         8, decode (substr('&1', 1, 2), '12', 'mt/ctable121.sql',
                                              'notavailable.sql'),
         9, decode (substr('&1', 1, 2), '12', 'mt/cprivilege121.sql',
                                              'notavailable.sql'),
         10, decode (substr('&1', 1, 2), '12', 'mt/crole121.sql',
                                              'notavailable.sql'),
         11, decode (substr('&1', 1, 2), '12', 'mt/cobjectpriv121.sql',
                                              'notavailable.sql'),
         12, decode (substr('&1', 1, 2), '12', 'mt/cdata121.sql',
                                              'notavailable.sql'),
         0, 'ex.sql',
         'ex.sql')
    into :category_menu
    from dual;
end;
/
col acc_scriptname new_value col_scriptname noprint
select :category_menu acc_scriptname
  from dual;
set termout on

start &col_scriptname
