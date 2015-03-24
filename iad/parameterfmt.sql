/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-24
File name:      parameterfmt.sql

Description:
Oradistrict Toolbox - database parameter value - reformatting output.

*/
set heading on
set verify off

col name for a30 hea 'Parameter Name'
col value for a32 hea 'Parameter Value'
col isdefault for a3 hea 'IsD'
col ispdb_modifiable for a4 hea 'IsPM'
col pdb_name for a16 hea 'Container Name'
col con_id for 999999 hea 'Con ID'

--col  for  hea ''
