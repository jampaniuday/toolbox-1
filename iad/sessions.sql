/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-08
File name:      sessions.sql

Description:
Oradistrict Toolbox - Sessions report.

*/

set heading on

col osuser for a14
col username for a12
col program for a38
col terminal for a20
col machine for a20
set linesize 140

select osuser, username, program, terminal, machine, last_call_et from v$session
 order by username;
