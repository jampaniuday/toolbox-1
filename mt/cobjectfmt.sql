/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-17
File name:      objectfmt.sql

Description:
Oradistrict Toolbox - List of objects owned by pointed user - reformatting output.

*/

set heading on
set verify off

--col owner for a16 hea 'Owner'
col object_name for a30 hea 'Object name'
col object_type for a20 hea 'Object type'
col created for a19 hea 'Creation date'
col status for a7 hea 'Status'
col name for a16 hea 'Container name'
