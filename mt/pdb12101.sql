/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-11
File name:      pdb12101.sql

Description:
Oradistrict Toolbox - List all pluggable databases in CDB.

*/

start mt/pdbfmt.sql

prompt
prompt Key for column names
prompt CID - Container ID

select con_id, pdb_name, status
  from dba_pdbs
 order by 1;
prompt
prompt (hit enter to continue)
pause

start ex.sql
