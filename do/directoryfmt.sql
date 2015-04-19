/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-14
File name:      directoryfmt.sql

Description:
Oradistrict Toolbox - List directories in database - reformatting output.

*/

set heading on

col owner for a16 hea 'Owner'
col directory_name for a20 hea 'Directory name'
col directory_path for a52 hea 'Directory path'
col origin_con_id hea 'Origin CID'

