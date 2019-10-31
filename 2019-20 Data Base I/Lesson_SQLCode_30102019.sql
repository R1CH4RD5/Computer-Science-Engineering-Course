/*SQL Intermediare Exercises*/

-- 1.1
select ename, sal, grade
from emp, salgrade
where sal between losal and hisal;
-- 1.2
select ename, sal, grade
from emp, salgrade
where sal >= losal and sal <= hisal; 

-- 2.
select ename, sal, grade
from emp, salgrade
where sal between losal and hisal
and sal > 2500;

-- 2.2
select ename, sal, grade
from emp, salgrade
where sal > &salary;
/*With the 2nd example, it gives the hability to choose
a 'number' with a 'toolbox'.*/

-- 3.
select ename, dename
from emp, dept
where emp.deptno = dept.deptno;

-- 4.
select ename, dname
from emp, dept
where emp.deptno = dept.deptno
and sal > 2500;

-- 5.
select ename, dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal;
/*Above is the 3 tables 'connections'. It's IMPO to remember 
than if we have 3 tables, we need to have 2 relations code lines 
like if we have 10 tables, we neet to have 9 relations code 
lines. Teacher says*/

select ename, dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal
and grade = &grade;
/*without the 'and sal between losal and hisal' it will 
give the cartesian product...*/

-- 6.
select ename, dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal
and grade = 3
order by ename;

-- 6.2 ordering by position
select ename, dname, grade
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal
and grade = 3
order by 1;

-- 7.
select dname, grade
from dept, salgrade, emp
where emp.deptno = dept.deptno
and sal between losal and hisal
and loc = 'NEW YORK';
/*We need the EMP table because DEPT and SALGRADE don't have a 
direct relationship, so we add the 2 line codes of the 2 relations 
"where emp.deptno = dept.deptno
and sal between losal and hisal".*/

-- 8.
select ename, dname, grade, sal, comm
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal
and (sal > 1550 or comm = 0 or comm IS NULL)
order by comm nulls first;
/*AND have 'precendence' of the OR. Using the '()' it 'makes the code 
line prioriry of the other, so we wanna first do the sal math and 
then select the respective values...'*/

select ename, comm, nvl(comm,999999999), nvl(to_char(comm), 'Não tem comissão, o desgraçado')
from emp;
/*Search about 'nvl'. Everery operation with NULL value will be NULL as result.*/

-- 8.2 using nvl
select ename, dname, grade, sal, comm
from emp, dept, salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal
and (sal > 1550 or nvl(comm,0) = 0)
order by nvl(comm,0);
/*SQL NVL Function. The NVL( ) function is available in Oracle, and not in MySQL 
or SQL Server. This function is used to replace NULL value with another value. It 
is similar to the IFNULL Function in MySQL and the ISNULL Function in SQL Server.
- Google*/

-- 9.
select dname, ename
from emp right join dept
on emp.deptno = dept.deptno;

select dname, ename
from emp, dept
where emp.deptno (+) = dept.deptno;
