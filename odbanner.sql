/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-08
File name:      odbanner.sql

Description:
Oradistrict Toolbox - Startup script

*/

set termout off

set pagesize 250
set linesize 92
set feedback off
set heading off

set termout on

prompt *******************************************************************************************
prompt Welcome in Oradistrict Toolbox: Viewer
prompt 
prompt --Version: 1.0
prompt Last date: 2015-03-08
prompt ---Author: Patrycjusz Konkol
prompt --------@: patrycjusz\\@//oradistrict.com --please remove //\\
prompt *******************************************************************************************
prompt Current date and time:
select sysdate
  from dual;
start odstart.sql
