/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-23
File name:      container121.sql

Description:
Oradistrict Toolbox - List all containers in CDB.

*/

start mt/containerfmt.sql

select con_id, name, dbid, round(total_size/1024/1024,2) total_size,
       open_mode, to_char(open_time, 'YYYY-MM-DD HH24:MI:SS') open_time,
       restricted
  from v$containers
 order by con_id;

prompt
prompt (hit enter to continue)
pause

start mt/mtmenu.sql
