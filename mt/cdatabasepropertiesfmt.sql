/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-13
File name:      cdatabasepropertiesfmt.sql

Description:
Oradistrict Toolbox - database properties list - for all active containers or locally for only one pdb - reformatting output.

*/

set heading on
ttitle off
clear breaks

col property_name for a24 hea 'Property name'
col property_value for a24 hea 'Property value'
col description for a42 hea 'Property description'
col con_id for 99999 hea 'ConID'
col pdb_name new_value col_pdb_name for a16 hea 'Container Name' noprint
