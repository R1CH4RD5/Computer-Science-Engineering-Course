-- DATA BASE I - 14/11/2019,
-- Ricardo Costa (José Costa 1010393)

-- -----------------------------------------------------------------------------

-- VIEWS
/*'It's something like a prebuilted select...'*/

select * from dept;

/*Insert a record into the DEPT table.*/
insert into dept (deptno,dname)
values(50,'Informática');

select deptno,dname
from dept
where loc IS NOT NULL;
/*'IS' and 'IS NOT' it's only for NULL's values. Never use 'EQUAL' or 'NOT EQUAL'.*/

/*Creating a View of the 'select' above:*/
create view departments as
select deptno,dname
from dept
where loc IS NOT NULL;
/*Now we can use , for example:*/
/*desc departments*/
select * from departments;

/*Ex: Make changes on DEPT and check using the above View created.*/
update dept
set loc = 'GUARDA'
where deptno = 50;

select * from departments;

/*Ex: Update loc to null value where deptno = 50.*/
update dept
set loc = null
where deptno = 50;

select * from departments;

/*To hanging a View, we can replace one where can already exist. Other method is 
using 'drop view' but it's better to use the first option.*/
create or replace view departments as
select deptno,dname
from dept
where loc IS NOT NULL;

/*We can use the View instead the table.*/
select ename,dname
from emp,departments
where emp.deptno = departments.deptno;

-- VIEW ADVANTAGES:
/*The advantages of the Views are:
- we can resume a complex select;
- lowest probability of doing erros when using a View instead of writen that 
select;;
- it can have better performance where it depends of the View construction. 
One View can be more optiized than another, for example;
- make data more understandable;
- (for last and more importante - Teacher) Security. For example we can only give 
privileges to View's to a user instead given privileges of the tables, and the 
same time only give access previously controled by us...*/

/*Deleting a View:*/
drop view departments;

delete dept
where deptno = 50;

rollback;

-- EXERCICES ------------------------------------------------------------------
/*1.*/
select ename, dname
from emp,dept
where emp.deptno = dept.deptno;

/*2.*/
select ename, empno, (select ename from EMP where empno = e.mgr)AS MANAGER, mgr 
from emp e;

select empe.ename,empm.ename
from emp empe,emp empm
where empe.mgr = empm.empno;

create or replace view manger as select empno manno,ename mname from emp;
select empno,ename from emp;
select * from manger;

select ename,mname
from emp,manger
where mgr=manno;


select emp2.empno,emp2.ename,emp2.mgr,emp3.empno,emp3.ename
from emp emp2,emp emp3
where emp3.mgr=emp2.empno;


/*3.*/
select ename,loc
from emp,dept
where mgr = (
  select empno
  from emp
  where ename = 'BLAKE'
);
