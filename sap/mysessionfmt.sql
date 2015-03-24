/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-23
File name:      mysessionfmt.sql

Description:
Oradistrict Toolbox - current session information - reformatting output.

*/

set heading on

col osuser for a14 hea 'OS User'
col username for a12 hea 'User Name'
col service_name for a12 hea 'Service Name'
col program for a26 hea 'Program'
col machine for a16 hea 'Machine'
col con_id for 99999 hea 'ConID'
col pdb_name for a48 hea 'Container Name'
