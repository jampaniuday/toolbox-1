/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-12
File name:      pdb12102.sql

Description:
Oradistrict Toolbox - List all pluggable databases in CDB.

*/

start mt/pdbfmt.sql

prompt
prompt Key for column names
prompt FL - force logging
prompt FnL - force nologging

select con_id, pdb_name, status, logging, force_logging, force_nologging
  from dba_pdbs
 order by 1;
prompt
prompt (hit enter to continue)
pause

start mt/mtmenu.sql
