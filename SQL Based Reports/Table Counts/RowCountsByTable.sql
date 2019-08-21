SET PAGESIZE 999
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF
SPOOL rowcountsbytable.html
 
SET MARKUP HTML ENTMAP OFF
PROMPT <hr>
PROMPT <a name="tablecounts"><h2>Table Counts</h2></a>
SET MARKUP HTML ENTMAP ON

col count format 999,999,999;

select table_name, to_number( extractvalue( xmltype( dbms_xmlgen.getxml('select count(*) c from '||table_name)),'/ROWSET/ROW/C')) count
from user_tables
order by count desc;

SET MARKUP HTML ENTMAP OFF
PROMPT <a href="#top">back to top</a>
PROMPT <hr>
SET MARKUP HTML ENTMAP ON

SPOOL OFF
SET MARKUP HTML OFF
exit