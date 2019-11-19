-- DATA BASE I - 23/10/2019,
-- Ricardo Costa (José Costa 1010393)

-- UNION
select ename, empno
from emp 
where sal > 1500
UNION
select ename, empno
from emp
where deptno = 20;
/*'Union' doesn't have duplications, and show the results ordered (order from 
the first column(?).)*/

-- UNION ALL
select ename, empno
from emp
where sal > 1500
UNION ALL
select ename, empno
from emp
where deptno = 20;
/*'Union all' it is faster to show the results, but it shows duplications.*/

-- INTERSECT
select ename, empno
from emp
where sal > 1500
INTERSECT
select ename, empno
from emp
where deptno = 20;
/*'Intersect doesn't show duplications and show the results ordered.'*/

-- MINUS
select ename, empno
from emp
where sal > 1500
MINUS
select ename, empno
from emp
where deptno = 20;

-- UNION with ORDER BY
select ename, empno
from emp
where sal > 1500
UNION
select job, sal
from emp
where deptno = 20
order by empno;

/* NOTES
  To show the results, the columns have to have the same data type, ex:
  
  select ename, empno
  ...
  (operator)
  ...
  select job, sal

ename (string) and job (strig) have the same data type, and empno (int) have 
the same as the sal (int).
*/
