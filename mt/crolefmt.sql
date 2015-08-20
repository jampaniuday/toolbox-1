/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-19
File name:      crolefmt.sql

Description:
Oradistrict Toolbox - List of roles, roles granted to users and other roles
- reformatting output.

*/

set heading on
set verify off

col container_name for a16 hea 'Container name'
col role_name for a20 hea 'Role name'
col password_required for a10 hea 'Pass. req.'
col authentication_type for a13 hea 'Authent. type'
col common for a1 hea 'C'
col oracle_maintained for a2 hea 'OM'
col admin_option for a2 hea 'AO'
col delegate_option for a1 hea 'D'
col default_role for a2 hea 'DR'
col grantee for a24 hea 'Grantee'
col granted_role for a24 hea 'Granted role'
col privilege for a40 hea 'Privilege'
