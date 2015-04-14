/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-13
File name:      cdatabaseproperties121.sql

Description:
Oradistrict Toolbox - database properties list - for all active containers or locally for only one pdb.

*/

start mt/cdatabasepropertiesfmt.sql

-- set start value for pdb_name new value
set term off
select 'start' pdb_name from dual;
set term on

ttitle center 'Database properties for a PDB:  ' col_pdb_name skip 2
  break on pdb_name skip page
  btitle off

select decode(p.property_name,
              null,
                decode(c.name,
                       'PDB$SEED',
                         '## SEED PDB - always closed ##',
                       '##   Open this PDB   ##'||chr(10)||chr(13)||'## to see properties ##'),
              p.property_name) property_name,
       decode (p.property_name,
               'MAX_SHARED_TEMP_SIZE',
               decode(p.property_value,
                      'UNLIMITED', 'UNLIMITED',
                      to_char(round(to_number(p.property_value)/1024/1024,2)) || ' MB'),
               'MAX_PDB_STORAGE',
               decode(p.property_value,
                      'UNLIMITED', 'UNLIMITED',
                      to_char(round(to_number(p.property_value)/1024/1024,2)) || ' MB'),
               p.property_value) property_value,
       p.description, c.name pdb_name
  from cdb_properties p right outer join v$containers c
    on (p.con_id = c.con_id)
 order by p.con_id asc, p.property_name asc;

clear breaks
ttitle off

prompt
prompt (hit enter to continue)
pause

start mt/mtmenu.sql
