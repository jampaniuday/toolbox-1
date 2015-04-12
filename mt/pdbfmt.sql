/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-23
File name:      containerfmt.sql

Description:
Oradistrict Toolbox - List all containers in CDB - reformatting output.

*/

set heading on

col con_id for 999 hea 'CID'
col pdb_name for a32 hea 'Pluggable database name' wrap
col status for a13 hea 'Status'
col logging for a9 hea 'Logging'
col force_logging for a3 hea 'FL'
col force_nologging for a3 hea 'FnL'
