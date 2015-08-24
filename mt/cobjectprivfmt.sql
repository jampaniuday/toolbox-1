/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-24
File name:      cobjectprivfmt.sql

Description:
Oradistrict Toolbox - List of privileges on objects granted to pointed user
- reformatting output.

*/

set heading on
set verify off

col privilege for a12 hea 'Privilege'
col grantable for a1 hea 'G'
col common for a1 hea 'C'
col hierarchy for a1 hea 'H'
col container_name for a15 hea 'Container name'
col grantee for a14 hea 'Grantee'
col grantor for a14 hea 'Grantor'
col owner for a14 hea 'Owner'
col object_name for a18 hea 'Object name'
col type for a7 hea 'Ob.type'
