/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      11.2.0.4.0
Last date:      2015-08-11
File name:      mysession112.sql

Description:
Oradistrict Toolbox - current session information from v$session.

*/

start sap/mysessionfmt.sql

select s.username, s.osuser, s.program, s.service_name, s.machine
  from v$session s
 where s.sid = userenv('sid');

prompt
prompt (hit enter to continue)
pause

start ex.sql
