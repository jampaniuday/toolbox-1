/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-23
File name:      cdatabasepropertiesfmt.sql

Description:
Oradistrict Toolbox - database properties list - for all active containers or locally for only one pdb - reformatting output.

*/

set heading on
ttitle off
clear breaks

col property_name for a32 hea 'Property Name'
col property_value for a36 hea 'Property Value'
col con_id for 99999 hea 'ConID'
col pdb_name new_value col_pdb_name for a16 hea 'Container Name' noprint
