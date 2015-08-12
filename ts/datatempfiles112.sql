/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0
Last date:      2015-08-11
File name:      datatempfiles112.sql

Description:
Oradistrict Toolbox - List all database files in all containers.

*/

start ts/datatempfilesfmt.sql

prompt 
prompt ~~ data files ~~
select t.tablespace_name, t.status, f.file_id, f.file_name, f.status file_status
  from dba_tablespaces t, dba_data_files f
 where t.tablespace_name = f.tablespace_name
 order by t.tablespace_name, f.file_id;

prompt 
prompt ~~ temp files ~~
select t.tablespace_name, t.status, f.file_id, f.file_name, f.status file_status
  from dba_tablespaces t, dba_temp_files f
 where t.tablespace_name = f.tablespace_name
 order by t.tablespace_name, f.file_id;

prompt
prompt (hit enter to continue)
pause

start ex.sql
