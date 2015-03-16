/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-16
File name:      databasefmt.sql

Description:
Oradistrict Toolbox - Database report - reformatting output.

*/
set heading on

col dbid for 99999999999999999 hea 'Database ID (dbid)'
col name for a9 hea 'DB name'
col created for a19 hea 'DB creation date'
col current_scn for 99999999999999999 hea 'Current SCN'
col log_mode for a12 hea 'Log mode'
col open_mode for a20 hea 'Open mode'
col protection_mode for a20 hea 'Protection mode'
col protection_level for a20 hea 'Protection level'
col open_mode for a20 hea 'Open mode'
col controlfile_type for a7 hea 'CtlType'
col controlfile_created for a19 hea 'Ctl creation date'
col database_role for a16 hea 'Database role'
col switchover_status for a20 hea 'Switchover status'
col dataguard_broker for a9 hea 'DG broker'
col force_logging for a13 hea 'Force logging'
col flashback_on for a18 hea 'Flashback ON'
col cdb for a18 hea 'Container database'
col con_id for 999999 hea 'Con ID'
col pending_role_change_tasks for a30 hea 'Pending role change tasks (DG)'
col con_dbid for 9999999999999 hea 'PDB dbid'
col force_full_db_caching for a27 hea 'Force full database caching'

--col  for  hea ''
