-- DATA BASE I - 17/10/2019,
-- Ricardo Costa (José Costa 1010393)

-- IN
/*ex. Pick up the names of the EMP that work on the DEPT 10 or 30.*/
select ename 
from emp 
where deptno = 10 OR
deptno = 30;

select ename 
from emp 
where deptno IN (10,30,50);
/*OR and IN are the same, but it's more eficiente and easy too add new and more 
values with the IN.*/

-- ----------------------------------------------------------------------------

-- LIKE
/*ex. Pick up the Departement 'code' of scott.*/
select ename, deptno
from emp
where ename = 'SCOTT';
/*'SCOTT' has to be caps on, because Oracle it's sensitive on than.*/

/*ex. Pick up ename's from EMP where begins with 's'.*/
select ename, deptno
from emp
where ename LIKE 'S%';
/*The '%' means 0, 1 or more characters*/

/*ex. Pick up ename's from EMP that end with 's'.*/
select ename, deptno
from emp
where ename LIKE '%S';
/*The '%' means 0, 1 or more characters*/

/*ex. Pick up ename's from EMP that begin with 'j' and end with 's'.*/
select ename, deptno
from emp
where ename LIKE 'J%S';
/*The '%' means 0, 1 or more characters*/

/*ex. Pick up ename's from EMP that have 'a'.*/
select ename, deptno
from emp
where ename LIKE '%A%';
/*The '%' means 0, 1 or more characters*/

/*ex. Pick up ename's from EMP that the 2nd letter it's 'l'.*/
select ename, deptno
from emp
where ename LIKE '_L%';
/*The '_' it's 1 and only 1 character.*/

select * from
all_users
where username like 'BDI/_%' escape '/';
/*BDI and BDII, we want to select only the BDI. For that we need to use the '_'
as a character and not a especial character, so defining the '/' as escape with 
"escape '/'" and use it to 'block' the 'especial character effect' of '_'.*/

-- ----------------------------------------------------------------------------

-- SORTING (ex. list order)

select *from emp;

select ename, sal, empno
from emp
order by ename;
/*Order the result list alphabeticaly by ename.*/

select ename, sal, empno
from emp
order by ename asc;
/*Ascendent order.*/

select ename, sal, empno
from emp
order by ename desc;
/*Descendent order.*/

/*ex. Order by Department.*/
select ename, sal, deptno
from emp
order by deptno desc, ename desc;
/*After order the DEPTNO by descendent, it will order by ENAME and descendent 
in the same DEPTNO.*/

select ename, sal
from emp
order by deptno desc, ename desc;
/*We can order like the last example without showing the DEPTNO column.*/

select ename,sal*(1-nvl(comm,0)*100) aux,deptno
from emp
order by aux;
/*Any calcule done in one 'Column' we can defining it, in this case with aux or 
it own function itself, and order by it...*/

select ename,sal,comm
from emp
order by comm desc;
/*In this SQL the NULL value are always higher.*/

select ename,sal,comm
from emp
order by comm nulls first;
/*Order NULL's first.*/

select ename,sal,comm
from emp
where comm is not null
order by comm;
/*Don't show NULL values.*/

select ename, sal, empno
from emp
order by 1 desc;
/*We can order by the position number of the 'column' 1 is ename, like SAL 
results it will be the same as 2*/
