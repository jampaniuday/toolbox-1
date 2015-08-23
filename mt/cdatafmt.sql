/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-22
File name:      cdatafmt.sql

Description:
Oradistrict Toolbox - List of container data for pointed user - reformatting output.

*/

set heading on
set verify off

col container_name for a16 hea 'Container name'
col all_containers for a2 hea 'AC'
col default_attr for a1 hea 'D'
col username for a20 hea 'User name'
col owner for a20 hea 'Object owner'
col object_name for a28 hea 'Object name'
