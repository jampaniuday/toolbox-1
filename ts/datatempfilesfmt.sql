/*


Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-03-25
File name:      datatempfiles121.sql

Description:
Oradistrict Toolbox - List all database files in all containers - reformatting output.

*/

set heading on

col tablespace_name for a12 hea 'Tb Name' wrapped
col status for a9 hea 'Tb Status' wrapped
col file_id for 99999 hea 'Fl ID' wrapped
col file_name for a40 hea 'Fl Name' wrapped
col file_status for a9 hea 'Fl Status' wrapped
col con_name for a10 hea 'Cont. Name' wrapped
