/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-24
File name:      mysession121.sql

Description:
Oradistrict Toolbox - current session information from v$session.

*/

start sap/mysessionfmt.sql

select s.username, s.osuser, s.program, s.service_name, s.machine
  from v$session s 
 where s.sid = userenv('sid');

select c.name pdb_name
  from v$session s right outer join v$containers c
    on (s.con_id = c.con_id)
 where s.sid = userenv('sid');

prompt
prompt (hit enter to continue)
pause

start sap/sapmenu.sql
