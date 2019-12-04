-- DATA BASE I - 04/12/2019,
-- Ricardo Costa (José Costa 1010393)


-- PL/SQL
/*We can use PL/SQL to program directly in the data base. One the biggest 
advantage is that if theres a program that neet to change but it has 
multiple sectors to change (like computer software and smartphone app), 
using PL/SQL can save work because it will update both in case they use 
the same data base.*/

/*Diference between function and procedure is that the first one 
give a result and the 2nd doesn't.*/

-- TRIGGERS
/*Code saved into tables.*/

-- PACKAGE
/*Multiples procedures and functions organized into packages.*/

-- HELLO WORLD in PL/SQL Code
DECLARE

BEGIN

END;
/

-- 1. Example: Showing 'Hello Everybody!'.
SET serveroutput ON

BEGIN
  dbms_output.put_line('Hello Everybody!');
/*It executes but doesn't show any message in the output form. For 
that we insert 'set serveroutput on' that we only need to execute only once.*/
END;
/

-- 2. Example: Using Variables.
SET serveroutput ON
DECLARE
  v_greetings varchar2(30) := 'Hello Everybody!';
/*The values atribution is with ':='. But we can use 'default'.*/
BEGIN
  dbms_outpu.put_line(v_greetings);
END;
/

-- 3. Example: Using Variables v2.
SET serveroutput ON
DECLARE
  v_greetings varchar2(30);
BEGIN
  v_greetings := 'Hello Everybody!';
  dbms_outpu.put_line(v_greetings);
END;
/

-- 4. Example: ...
SET serveroutput ON
DECLARE
  v_greetings varchar2(30);
  v_number number(3,2) := 3.14;
  v_city varchar2(30) default 'Guarda;
  v_date date;
  c_pi v_number%TYPE := 3.14;
/*We can declare a variable that has a same type of another, the advantage
with this we can only change the 2st one to change the others. We can adapt.*/
  v_ename emp.ename%TYPE;
/*We can use a field of a already existing column type from a already 
existing table*/
BEGIN
  v_greetings := 'Hello Everybody!';
  dbms_outpu.put_line(v_greetings);
  dbms_output.put_line('O valor de PI é: '!!v_pi);
  v_date := sysdate;
  dbms_output.put_line(to_char(v_date,'dd/mm/yyyy hh24:mi:ss'));
END;
/

-- How can we use SQL inside a PL/SQL

/*SQL Query*/
select ename
from emp
where sal = (
  select max(sal)
  from emp
);

/*Using PL/SQL*/
DECLARE
  v_ename emp.ename%TYPE;
BEGIN
  select ename
    into v_ename
  from emp
  where sal = (
    select max(sal)
    from emp
  );
/*The only thing that we added from the SQL to 'turn it' into the PL/SQL,
was the 'into v_name' code line.*/
  dbms_output.put_line(v_ename;);
END;
/

-- 5. Example
DECLARE
  v_dname dept.dname%TYPE := 'Informátics';
BEGIN
  insert into dept (deptno,dname,loc)
  values (50,'Inf','Guarda');
  
  update dept set dname = 'Inf'
  where deptno = 50;
  
  select dname
  into v_dname
  from dept
  where deptno = 50;
  
  -- delete dept where deptno = 50;
END;
/

select * from  dept;

/*In case a 'exact' error, it means that is giving multiple values/results, for 
example*, if we use 'select dname into d_name from dept;'./
