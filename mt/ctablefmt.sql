/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-17
File name:      ctablefmt.sql

Description:
Oradistrict Toolbox - List of tables owned by pointed user - reformatting output.

*/

set heading on
set verify off

col table_name for a30 hea 'Table name'
col tablespace_name for a30 hea 'Tablespace name'
col name for a16 hea 'Container name'
