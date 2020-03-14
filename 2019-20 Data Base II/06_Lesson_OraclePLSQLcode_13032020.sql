-- Base de Dados II  13/03/2020
-- Ricardo Costa (José Costa 1010393)

-- FETCH
SELECT ENAME, DEPTNO
FROM EMP
ORDER BY ENAME
FETCH FIRST 5 ROWS ONLY;
/*When using FETCH, we can obtain not all registers/rows of the table by a 
especific number of rows. It will get a specified number of rows.*/

-- OFFSET
SELECT ENAME, DEPTNO
FROM EMP
ORDER BY ENAME
OFFSET 3 ROWS;
/*Same as FETCH by here we can especify the row where the FETCH will begin, 
jumping that number of rows, especified on the query. It will jump a especified 
number of rows.*/

-- OFFSET and FETCH
SELECT ENAME, DEPTNO
FROM EMP
ORDER BY ENAME
OFFSET 3 ROWS
FETCH FIRST 5 ROWS ONLY;
/*This will result on showing that especific rows from the 4th to 8th row of the 
table.*/

-- Showing the 10th line of the Table
SELECT ENAME, DEPTNO
FROM EMP
ORDER BY ENAME
OFFSET 9 ROWS
FETCH FIRST 1 ROWS ONLY;
/*This will show the 10th row of the Table.*/

-- -----------------------------------------------------------------------------

/*Ex1: From the DEPT Table, we want to show only 3 random departments.*/
SELECT * FROM DEPT;

SET SERVEROUTPUT ON;

DECLARE
  v_count number(9);
  v_rand number(9);
  v_dname dept.dname%TYPE;
BEGIN
  SELECT COUNT(*)         -- this query will count the number of registers
  INTO v_count
  FROM DEPT;
  
  FOR i IN 1..3 LOOP
    v_rand := trunc(dbms_random.value(0,v_count));
    
    SELECT DNAME
    INTO v_dname
    FROM DEPT
    OFFSET v_rand ROWS
    FETCH FIRST 1 ROW ONLY;
    
    dbms_output.put_line(v_dname);
  END LOOP;
END;
/
/*We need to remenber that if we don't especify the min and max, the 
'dbms_random.value;' will choose between 0 and 1. To choosing only one row, we 
can remove the LOOP. It's possible to change the code to not show repetition.*/
