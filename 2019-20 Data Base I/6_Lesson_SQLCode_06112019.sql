-- DATA BASE I - 06/11/2019,
-- Ricardo Costa (José Costa 1010393)

-- -----------------------------------------------------------------------------
/*Question: How manny students we have? How manny sales did I have since the 
beginning of the year?*/

-- Group Functions
-- Count
select count (*) from emp;
/*It will count the number of the records from the EMP table.*/

select count (empno) from emp;
/*It will count in order of the EMPNO column. It will count the on'es that is 
not NULL. Like in column COMM, it will show only 4 records.*/

-- SUM
select sum(sal) from emp;
/*The total sum of the SAL column.*/

-- MIN
select min(sal) from emp;
/**/

-- MAX
select max(sal) from emp;
/**/

-- AVERAGE
select avg(sal) from emp;
select round(avg(sal)) from emp;
/**/

/*The grouping functions need a 'array' of records, it doesn't work with 
singular values.*/

select round(sal) from emp;
/*It round each row/record.*/

select avg(sal)from emp where deptno = 30;
/*It show the average sal where deptno is equal 30.*/

select count(job) from emp where job = 'CLERK';
/*It counts the number of CLERK's that exist in the JOB column. It work with 
the '*' to.*/

select job,count(*)
from emp
group by job;
/*It will show how manny records of the each job has. It seperates the diferent 
jobs by creating little groups and then count each group.*/

select job,deptno,count(*)
from emp
group by job, deptno
order by job, deptno;
/*It shows the number of the records of the diferente JOB's where the JOB's 
have diferent Departments.*/

select job, sum(sal), max(sal),min(sal),round(avg(sal)),count(*)
from emp
group by job;
/*It agroup each JOB in small groups and then do the math on each group.*/

select avg(count(*))
from emp
group by job;
/*It can calculate the average of the number of employees of each JOB, after 
counting the number of employees on each JOB/group.*/

/*Question: How manny diferent types of the JOB's I have?*/
select distinct job
from emp;
/*The correct answers is:*/
select count(distinct job)
from emp;
/*The first one it shows the list of the diferent jobs. The 2nd one shows the 
number of the diferent jobs.*/

select count(*)
from emp
group by job;
/*It count the number od diferent types of JOB's.*/

select count(count(*))
from emp
group by job;
/*It count a 2nd time the first count.*/

select job
from emp
group by job;
/*Show the list of diferent types of JOB's.*/


-- 
select deptno,job,count(*),avg(sal)
from emp
group by deptno,job;

select deptno,job,count(*),avg(sal)
from emp
where deptno < 30
group by deptno,job;
/*The 'where' it needs to be before the 'group by'. Note: 'order by' it's the 
last.*/

select deptno,job,count(*),avg(sal)
from emp
where deptno < 30
group by deptno,job
having avg(sal) > 2500;
/*Here we exclude the other 'groups' diferents choosing the 'group' equal 
'avg(sal) > 2500' result. To use 'having' we need to have a 'group by'.*/

select dname,job,count(*),avg(sal)
from emp,dept
where emp.deptno = dept.deptno
and emp.deptno < 30
group by dname,job
having avg(sal) > 2500
order by 2;
/*ex. with some/all the class subjects learned until now...*/
