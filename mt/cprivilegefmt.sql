/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-19
File name:      cprivilegefmt.sql

Description:
Oradistrict Toolbox - List of privileges granted to pointed user
- reformatting output.

*/

set heading on
set verify off

col grantee for a22 hea 'Grantee'
col privilege for a40 hea 'Privilege'
col admin_option for a2 hea 'AO'
col common for a1 hea 'C'
col container_name for a18 hea 'Container name'
col delegate_option for a1 hea 'D'
col default_role for a2 hea 'DR'
col grantee for a24 hea 'Grantee'
col granted_role for a24 hea 'Granted role'
