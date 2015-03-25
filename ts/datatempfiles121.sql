/*


Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-25
File name:      datatempfiles121.sql

Description:
Oradistrict Toolbox - List all database files in all containers.

*/

start ts/datatempfilesfmt.sql

prompt 
prompt ~~ data files ~~
select t.tablespace_name, t.status, f.file_id, f.file_name, f.status file_status,
       c.name con_name
  from cdb_tablespaces t, cdb_data_files f, v$containers c
 where t.tablespace_name = f.tablespace_name
   and f.con_id = c.con_id
   and t.con_id = c.con_id
 order by c.con_id, t.tablespace_name, f.file_id;

prompt 
prompt ~~ temp files ~~
select t.tablespace_name, t.status, f.file_id, f.file_name, f.status file_status,
       c.name con_name
  from cdb_tablespaces t, cdb_temp_files f, v$containers c
 where t.tablespace_name = f.tablespace_name
   and f.con_id = c.con_id
   and t.con_id = c.con_id
 order by c.con_id, t.tablespace_name, f.file_id;

prompt
prompt (hit enter to continue)
pause

start ts/tsmenu.sql
