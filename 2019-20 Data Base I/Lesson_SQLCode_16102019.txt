-- DATA BASE I - 16/10/2019,
-- Ricardo Costa (José Costa 1010393)

select * from cat;

purge recyclebin;

-- View EMP table
select * from emp;

-- View the 'Name' Column of the EMP table
select empno,ename from emp;

-- View Department table
select * from dept;

-- Describe Department table (it can be done with 'desc [table]' too)
describe dept;
desc dept;

-- Insert a new Record into the Department table
insert into dept (deptno,dname,loc)
values (50,'Informática','Guarda');

-- View the new row added
select * from dept;

-- Update the loc of the last record added ('Guarda')
update dept
set loc = 'GUARDA'
where deptno = 50;
/*here we need to be specific with where, because if we don't use it
it will set loc into all of the table rows.*/

select * from dept;

-- Deleting a Recordof the Department table
delete dept
where deptno = 50;
/*here, same as the Update, we need to especify the operation to delete a
determined row, or else with will delete all the Department 'dept'.*/

select * from dept;

-- Deleting Department table (trying)
delete dept;
/*it will give a error because in this case the EMP table have a DEPT foreign
key so we can't delete the dept table. This kind of feature is to prevent
future errors, like 'shared information' between tables...*/

-- ----------------------------------------------------------------------------

-- Projection
select empno,ename from emp;
/*projection those columns.*/

-- Selection/Restriction
select * from emp
where deptno = 20;
/*it select/restrict the list with a especific restriction. Logical operations.
We can select like a list of the emp with a especific department (= 20). We also
can use other operators like '<', '>', '<=', etc...*/

select * from emp
where deptno > 10 and
deptno < 40;
/*restriction the table view with a list of emp with deptno between 10 and 40.*/

select * from emp
where deptno < 20 or
deptno >= 30;
/*here we only want to restrict less than 20 and more or equal than 30.*/

select * from emp
where NOT (deptno < 20 or
deptno >= 30);
/*the 'NOT', 'AND' and 'OR', list of precedence, so in this case we use ().*/

select 'Good Morning!' from emp;
select 'Good Morning!' from dual;
/*'dual' table only have 1x'Good Morning!'.*/

select sysdate from dual;
/*short date format*/
select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') from  dual;
/*extended date format*/

select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') data from  dual;
/*edit the column name, in this case, we will name the column 'data'. If we use
the "" we can name it exactly as writen, with spaces included.*/

-- ----------------------------------------------------------------------------

select * from emp;

select * from emp
where comm IS NULL;
select * from emp
where comm IS NOT NULL;
/*the operator 'IS' and 'IS NOT' it's only for NULL's values.*/

select 4 * NULL from dual;
select 4 + NULL from dual;
select 4 / NULL from dual;
select NULL / 0 from dual;
/*NULL = lack of value. We need to pay attention to NULL's because any
operation that we do with NULL, it always give NULL results. Pay attention
if we have NULL's in tables because can cause errors.*/

-- ----------------------------------------------------------------------------

select 'drop table '||table_name||';'from cat;
/*better to administrate multi tables(?).*/

-- ----------------------------------------------------------------------------

select ename,sal
from emp
where sal >= 1000
AND sal <= 3000;

select ename,sal
from emp
where sal between 1000 and 3000;
/*the both codes do the same thing, inclusive the between 'command' it count
the values 1000 and 3000. 'Between' equals '>= and <='.*/

select ename,sal
from emp
where not (sal between 1000 and 3000);
/*teacher says it gives a better code visualization.*/
-- ----------------------------------------------------------------------------

select 'ola'' tirma' from dual;
/*if we want add a ' into the 'variable', we double it.*/
