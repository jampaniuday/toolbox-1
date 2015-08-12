/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-08-11
File name:      directory112.sql

Description:
Oradistrict Toolbox - List directories from database.

*/

start do/directoryfmt.sql

select owner, directory_name, directory_path
  from dba_directories
 order by 1, 2;

prompt
prompt (hit enter to continue)
pause

start ex.sql
