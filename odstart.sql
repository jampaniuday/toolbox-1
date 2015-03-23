/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-08
File name:      odstart.sql

Description:
Oradistrict Toolbox - Startup script

*/

clear screen

set termout off
set feedback off
set heading off
set pagesize 250
set linesize 92
set recsep off
col current_date for a23 hea 'Current date and time'
col current_version for a17 hea 'Detected version'
col release new_value col_version for a8 hea 'Release'

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
alter session set nls_timestamp_format = 'YYYY-MM-DD HH24:MI:SS.FF';
alter session set nls_timestamp_tz_format = 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM';
variable v_dbversion varchar2(17)
begin
  select trim(version)
    into :v_dbversion
    from v$instance;
end;
/

set termout on

prompt *******************************************************************************************
prompt Welcome in Oradistrict Toolbox: Viewer
prompt
prompt --Version: 1.0
prompt Last date: 2015-03-08
prompt ---Author: Patrycjusz Konkol
prompt --------@: patrycjusz\\@//oradistrict.com --please remove //\\
prompt *******************************************************************************************
set heading on
select sysdate current_date, :v_dbversion current_version,
       substr(:v_dbversion, 1, instr(:v_dbversion, '.', 1, 4) - 1) release
       -- , case when :v_dbversion > '12.0.0.0.0' then '12.1' else 'lower than 12c' end testcol
  from dual;
set heading off

prompt 
prompt > Main menu
prompt 
prompt Chose category:
prompt 1)  instance and database (parameters and status)
prompt 2)  sessions and processes
prompt 3)  multitenant (container database)
--prompt 3)  security (users, privileges, profiles)
--prompt 4)  redo log (with archived redo log)
--prompt 5)  tablespaces (with data files and temp files)
prompt 
prompt 0)  exit (*)
prompt 
prompt Default value always with (*)

accept acc_choice number default 0 prompt "Input your choice: "

set termout off
variable category_menu varchar2(30)
declare
begin
  select decode (&acc_choice, 1, 'iad/iadmenu.sql',
                              2, 'sap/sapmenu.sql',
                              3, 'mt/mtmenu.sql',
                              0, 'ex.sql',
                                 'ex.sql')
    into :category_menu
    from dual;
end;
/
col acc_scriptname new_value col_scriptname noprint
col acc_version new_value col_version noprint
select :category_menu acc_scriptname
  from dual;
set termout on

start &col_scriptname &col_version
