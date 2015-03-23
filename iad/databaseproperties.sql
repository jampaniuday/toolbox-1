/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0, 12.1.0.2.0
Last date:      2015-03-23
File name:      databaseproperties.sql

Description:
Oradistrict Toolbox - Startup script for: database properties list - only for currently connected container or database if executed from pdb

*/

start iad/databasepropertiesfmt.sql

select property_name,
       decode (property_name,
               'MAX_SHARED_TEMP_SIZE',
                 to_char(round(to_number(property_value)/1024/1024,2)) || ' MB',
               'MAX_PDB_STORAGE',
                 to_char(round(to_number(property_value)/1024/1024,2)) || ' MB',
               property_value) property_value,
       description
  from database_properties
 order by property_name, property_value;
prompt
prompt (hit enter to continue)
pause

start iad/iadmenu.sql
