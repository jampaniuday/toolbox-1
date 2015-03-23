/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-23
File name:      databasepropertiesfmt.sql

Description:
Oradistrict Toolbox - Database properties list - reformatting output.

*/
set heading on

col property_name for a24 hea 'Property name'
col property_value for a24 hea 'Property value'
col description for a42 hea 'Property description'
