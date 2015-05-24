/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-05-24
File name:      cusersfmt.sql

Description:
Oradistrict Toolbox - List all users in CDB - reformatting output.

*/

set heading on

col username for a24 hea 'User name' wrap
col account_status for a18 hea 'Account status' wrap
col created for a19 hea 'Created date'
col profile for a10 hea 'Profile'
col initial_rsrc_consumer_group for a24 hea 'Resource cons. grp.' wrap
col common for a1 hea 'C'
col oracle_maintained for a2 hea 'OM'
col user_id for 9999999999 hea 'User Id' wrap

col con_id for 9999 hea 'CnID' wrapped
col con_name for a15 hea 'Container Name' wrapped

