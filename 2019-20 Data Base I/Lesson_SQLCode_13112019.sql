/*13/11/2019*/

-- SubQuery
/*2nd Query inside of a 1st one. (SELECT, INSERT, UPDATE or DELETE.)*/

/*Question: What is the maximun salary of the table EMP?*/
select max(sal)
from emp;

/*Question: Now I want to know the Name of the employee that receives the above 
salary result (5000).*/
select ename, max(sal)
from emp
group by ename;
/*Incorrect. In this case we need the 'group by' because the columns... the 
'group by' resolve that... But the answer that we need is not this one. So, until 
now, to know the answer we need to execute 2 querys:*/
/*1*/
select max(sal)
from emp;
/*2*/
select ename,sal
from emp
where sal = 5000;
/*We can use both querys in one, like:*/
select ename,sal
from emp
where sal = (
  select max(sal)
  from emp
);
/*In this query, we have a subquery. (Correct answer.)*/

/*Question(A): Select the name of the employees where the salary is more than the 
average.*/
select ename, sal
from emp
where sal > (
  select avg(sal)
  from emp
);

/*Question(B): name and salary where the salary is grater than the average of is 
department.*/
select ename,sal
from emp int
where sal > (
  select avg(sal)
  from emp ext
  where int.deptno = ext.deptno
);
/*We need to equal de diferents 'from', in this case where the table (emp) the
table is the same. We equal the internal (int) 'from' with the external (ext) 
'from'.*/

-- NOTE
/*When the subquery depends of the 1st one, like the last question above (B), 
its a 'Co-Relationship', in case where the subquery doesn't depend of the 1st 
one like the 1st question (A), it's a 'No Co-Relationship'.*/

/*Question: Name, Salary and the Department where the salary is the lowest of 
this Department.*/
select ename,sal
from emp int
where sal = (
  select min(sal)
  from emp ext
  where int.deptno = ext.deptno
);

/*Remember:*/
select deptno,dname
from dept
where loc in ('DALLAS', 'CHICAGO');
/*Equals to saying, 'loc' equal DALLAS or equal CHICAGO.*/

/*Ex: Give the lowest salary of eatch department and then compare with the 
salary of each employee. When the lowest salary of that department equals to 
the salary of a employee, show it...*/
select deptno,min(sal)
from emp
group by deptno;

select ename, sal, deptno
from emp
where (deptno,sal) IN (
  select deptno,min(sal)
  from emp
  group by deptno
);
/*This last one, is a 'No Correlated', because it only compares the results The 
subquery doesn't depends of the int query... The 'IN' it serves to compare the 
query's results.*/

-- NOTES:
/*We can do other things with subquerys than compare results. For example:*/
select *
from (
  select deptno,dname
  from dept
  where loc IN ('DALLAS','CHICAGO')
)
where deptno < 30;
/*or*/
select ename,sal, (select max(sal) from emp), (select count(*) from dept)
from emp
order by (select max(sal) from emp);
/*'group by' is there we can't use subquery's.*/

-- DML (SELECT, DELETE and UPDATE...)
select * from dept;
/*Insert a new record.*/
insert into dept (deptno,dname,loc)
values(50,'ENSINO','GUARDA');
/*Confirm.*/
select * from dept;
/*Update the record.*/
update dept
set loc = 'ZAMBITO'
where deptno = 50;
/*Confirm.*/
select * from dept;
/*Delete a record.*/
delete dept
where deptno = 50;
/*Confirm.*/
select * from dept;

/*Create a table based in other table. (Same struture).*/
create table empregados as
select * from emp
where 1 = 0;
/*1 = 0 -> empty...*/
/*Confirm.*/
select * from empregados;
/*Insert lot of records using subquery's.*/
insert into empregados (empno,ename,sal,deptno)
select empno, ename,sal*1.25,deptno
from emp
where sal > 2500;
/*Confirm.*/
select * from empregados;
/*Update the table with the sal average of the emp...*/
update empregados
set sal = (
  select avg(sal)
  from emp
);
/*Its update the table with values of other table.*/
/*Confirm.*/
select * from empregados;
/*Update with 2 subquery's, using 2 diferent tables...*/
update empregados
set sal = (
  select min(sal)
  from emp
)
where deptno IN (
  select deptno
  from dept
  where loc LIKE '%W%'
);
/*Its making a relationship of empregados and dept with the deptno...*/

select ename,sal
from emp,dept
where emp.deptno = dept.deptno
and loc = 'DALLAS';
/*now using a subquery:*/
select ename,sal
from emp
where deptno = (
  select deptno
  from dept
  where loc = 'DALLAS'
);
/*Both results are the same but on the 2nd one we are using a subquery. In this 
case the 'IN' and '=' it works because theres only one 'DALLAS'... the '=' doesn't 
work with a list on the 'IN'...*/
select ename, sal
from emp,dept
where emp.deptno = dept.deptno
and loc LIKE '%O%';
/*now with a subquery:*/
select ename,sal
from emp
where deptno IN (
  select deptno
  from dept
  where loc LIKE '%O%'
);
/*In this both cases we can't use the '=' instead of 'LIKE', it will not work...*/