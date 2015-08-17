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
col name for a20 hea 'Container name' wrap
col dbid for 99999999999 hea 'DbID' wrap
col total_size for 999999999 hea 'Size in MB'
col open_mode for a10 hea 'Open mode'
col open_time for a22 hea 'Open time'
col restricted for a3 hea 'Res'
