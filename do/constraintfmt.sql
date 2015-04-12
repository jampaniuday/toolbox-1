/*

Author:         Patrycjusz Konkol
Contact:        patrycjusz\\@//oradistrict.com --please remove //\\
Tested on:      12.1.0.2.0
Last date:      2015-04-12
File name:      constraintfmt.sql

Description:
Oradistrict Toolbox - List constraints from pointed owner - reformatting output.

*/

set heading on
set verify off

col owner for a16 hea 'Owner'
col constraint_name for a16 hea 'Constraint name'
col constraint_type for a2 hea 'CT'
col r_owner for a12 hea 'Refer. obj. owner'
col r_constraint_name for a16 hea 'Ref. constr. name'
col table_name for a20 hea 'Table name'

